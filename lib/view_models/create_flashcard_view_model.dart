import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/exception/flashcard_name_busy.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/model/word.dart';
import 'package:primus/utils/firebase_error.dart';
import 'package:primus/utils/language_provider.dart';
import 'package:primus/utils/popup.dart';
import 'package:primus/widgets/create_flashcard_widget.dart';
import 'package:provider/provider.dart';

class FlashcardViewModel extends ChangeNotifier {
  FlashcardViewModel(this.context) {
    _init();
    generateTextField();
    generateTextField();
  }

  final BuildContext context;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController languageController = TextEditingController();

  bool loading = false;

  List<TextEditingController> wordControllers = [];
  List<TextEditingController> definitionControllers = [];
  List<TextFormField> wordFields = [];
  List<TextFormField> definitionFields = [];

  /// Flashcard list from firestore
  List<Flashcard> flashcardList = [];

  late List<CreateFlashcardWidget> flashcardsWidget;
  late AppLocalizations appLocalizations;
  late CollectionReference flashcardCollection;

  late String uid;

  _init() async {
    loading = true;
    notifyListeners();
    var locale = Provider.of<LanguageProvider>(context, listen: false).currentLocale;
    flashcardCollection = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name);
    uid = FirebaseAuth.instance.currentUser!.uid;
    appLocalizations = await AppLocalizations.delegate.load(locale);
    _initFields();
    _initListFlashcard();
    loading = false;
    notifyListeners();
  }

  void _initFields() {
    flashcardCollection.doc(uid).get().then((document) {
      if ((document.data() as Map<String, dynamic>).isEmpty) {
        _createFields();
      }
    });
  }

  void _initListFlashcard() {
    flashcardCollection.doc(uid).get().then((document) {
      var value = document.data() as Map<String, dynamic>;
      var helpValue = value['flashcard'] as List;
      if (helpValue.isNotEmpty) {
        for (var element in helpValue) {
          flashcardList.add(Flashcard.fromJson(element));
        }
      }
    });
  }

  void _createFields() {
    Map<String, dynamic> json = {};
    json['flashcard'] = [];
    json['uid'] = uid;
    flashcardCollection.doc(uid).set(json);
  }

  void generateTextField() {
    var wordController = TextEditingController();
    var definitionController = TextEditingController();

    var word = TextFormField(
      controller: wordController,
      decoration: InputDecoration(
        hintText: appLocalizations.wordHint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return appLocalizations.flashcardsNameError;
        }
        return null;
      },
    );

    var definition = TextFormField(
      controller: definitionController,
      decoration: InputDecoration(
        hintText: appLocalizations.definitionHint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return appLocalizations.flashcardsNameError;
        }
        return null;
      },
    );

    wordControllers.add(wordController);
    definitionControllers.add(definitionController);
    wordFields.add(word);
    definitionFields.add(definition);
    notifyListeners();
  }

  void removeFlashcard(int index) {
    wordControllers.removeAt(index);
    definitionControllers.removeAt(index);
    wordFields.removeAt(index);
    definitionFields.removeAt(index);
    notifyListeners();
  }

  void createFlashcardSet() async {
    loading = true;
    notifyListeners();

    try {
      await _checkFlashCardName();
    } on FlashCardNameBusy {
      loading = false;
      notifyListeners();
      showSnackBarError(flashcardNameBusy, context);
    } catch (e, s) {
      if (kDebugMode) {
        print('administrator error: $e}');
        print('administrator stacktrace: $s}');
      }
      loading = false;
      notifyListeners();
      showSnackBarError(flashcardNameBusy, context);
      return;
    }

    List<Word> words = [];
    for (int i = 0; i < wordFields.length; i++) {
      words.add(Word(word: wordControllers[i].text, definition: definitionControllers[i].text));
    }

    flashcardList.add(Flashcard(languageSet: languageController.text, nameSet: nameController.text, words: words, timeStamp: DateTime.now().millisecondsSinceEpoch));
    flashcardCollection.doc(uid).update({'flashcard': flashcardList.map((e) => e.toJson()).toList()});

    loading = false;
    notifyListeners();

    Navigator.pop(context);
    showSnackBar(AppLocalizations.of(context)!.flashcardCreate, context);
  }

  Future<void> _checkFlashCardName() async {
    var document = await flashcardCollection.doc(uid).get();

    var value = document.data() as Map<String, dynamic>;

    if (value.isEmpty) {
      return;
    }

    FlashCardSet flashcard = FlashCardSet.fromJson(value);

    for (var element in flashcard.flashcards) {
      if (element.nameSet == nameController.text) {
        throw FlashCardNameBusy();
      }
    }
  }
}
