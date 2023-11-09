import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/exception/flashcard_name_busy.dart';
import 'package:primus/exception/too_short.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/model/user.dart' as myUser;
import 'package:primus/model/word.dart';
import 'package:primus/screen/home/home_page.dart';
import 'package:primus/features/auth/utils/firebase_error.dart';
import 'package:primus/utils/language_provider.dart';
import 'package:primus/utils/popup.dart';
import 'package:primus/view_models/home_view_model.dart';
import 'package:primus/widgets/create_flashcard_widget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class FlashcardViewModel extends ChangeNotifier {
  FlashcardViewModel(this.context,
      {this.flashcard, this.edit = false, this.copy = false}) {
    _init();
  }

  final BuildContext context;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final bool edit;
  final bool copy;

  Flashcard? flashcard;

  bool loading = false;

  List<TextEditingController> wordControllers = [];
  List<TextEditingController> definitionControllers = [];
  List<TextFormField> wordFields = [];
  List<TextFormField> definitionFields = [];

  late List<CreateFlashcardWidget> flashcardsWidget;
  late AppLocalizations appLocalizations;

  late String uid;
  late myUser.User user;

  _init() async {
    loading = true;
    notifyListeners();

    var locale =
        Provider.of<LanguageProvider>(context, listen: false).currentLocale;
    appLocalizations = await AppLocalizations.delegate.load(locale);

    uid = FirebaseAuth.instance.currentUser!.uid;
    var document = await FirebaseFirestore.instance
        .collection(FirebaseCollection.users.name)
        .doc(uid)
        .get();
    user = myUser.User.fromJson(document.data()!);

    if (flashcard == null) {
      genereteFields();
    } else {
      nameController.text = flashcard!.nameSet;
      languageController.text = flashcard!.languageSet;

      for (var element in flashcard!.words) {
        generateTextField(
            flashcardDefinition: element.definition,
            flashcardWord: element.word);
      }
    }

    loading = false;
    notifyListeners();
  }

  // When flachard is create generate first 4 fields
  void genereteFields() {
    for (var i = 0; i < 4; i++) {
      generateTextField();
    }
  }

  void generateTextField({String? flashcardWord, String? flashcardDefinition}) {
    var wordController = TextEditingController();
    var definitionController = TextEditingController();
    if (flashcardDefinition != null) {
      definitionController.text = flashcardDefinition;
    }

    if (flashcardWord != null) {
      wordController.text = flashcardWord;
    }

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

  Future<void> editFlashcardSet() async {
    loading = true;
    notifyListeners();

    try {
      if (wordFields.length < 4) {
        throw TooShort();
      }
      if (flashcard == null && edit) {
        throw UnimplementedError();
      }
    } on UnimplementedError {
      loading = false;
      notifyListeners();
      return;
    } on TooShort {
      loading = false;
      notifyListeners();
      showSnackBarError(flashcardTooShort, context);
      return;
    } catch (_) {
      loading = false;
      notifyListeners();
      return;
    }

    var flashcardSet = _generateFlashcardSet();

    await FirebaseFirestore.instance
        .collection(FirebaseCollection.flashcardSet.name)
        .doc(flashcardSet.flashcard.id)
        .update({'flashcard': flashcardSet.flashcard.toJson()});
    loading = false;
    notifyListeners();

    // Not back only push bcz stream builder dont detect edit flashcdardw
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(context),
          child: const HomePage(),
        ),
      ),
    );

    showSnackBar(AppLocalizations.of(context)!.flashcardUpdated, context);
  }

  // generate flashcard Set from words
  FlashCardSet _generateFlashcardSet() {
    List<Word> words = [];
    for (int i = 0; i < wordFields.length; i++) {
      words.add(Word(
        id: const Uuid().v4(),
        word: wordControllers[i].text,
        definition: definitionControllers[i].text,
      ));
    }
    String flashcardId;

    if (edit) {
      flashcardId = flashcard!.id;
    } else {
      flashcardId = const Uuid().v4();
    }

    var flascard = Flashcard(
      id: flashcardId,
      languageSet: languageController.text,
      nameSet: nameController.text,
      words: words,
      timeStamp: DateTime.now().millisecondsSinceEpoch,
    );

    FlashCardSet flashCardSet;

    if (copy) {
      flashCardSet = FlashCardSet(flashcard: flascard, owner: uid);
    } else {
      flashCardSet = FlashCardSet(flashcard: flascard, owner: user.uid);
    }

    return flashCardSet;
  }

  Future<void> createFlashcardSet() async {
    loading = true;
    notifyListeners();

    try {
      if (wordFields.length < 4) {
        throw TooShort();
      }

      await _checkFlashCardName();

      var flashCardSet = _generateFlashcardSet();

      await FirebaseFirestore.instance
          .collection(FirebaseCollection.flashcardSet.name)
          .doc(flashCardSet.flashcard.id)
          .set(flashCardSet.toJson());

      var document = 'flashcardSet/${flashCardSet.flashcard.id}';

      if (user.ownFlashcard == null) {
        user = user.copyWith(ownFlashcard: [document]);
        await FirebaseFirestore.instance
            .collection(FirebaseCollection.users.name)
            .doc(user.uid)
            .update(
                {'ownFlashcard': user.ownFlashcard!.map((e) => e).toList()});
      } else {
        var newOwnFlashcard = user.ownFlashcard;
        newOwnFlashcard!.add(document);

        user = user.copyWith(ownFlashcard: newOwnFlashcard);
        await FirebaseFirestore.instance
            .collection(FirebaseCollection.users.name)
            .doc(user.uid)
            .update(
                {'ownFlashcard': user.ownFlashcard!.map((e) => e).toList()});
      }
      if (copy) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => HomeViewModel(context),
              child: const HomePage(),
            ),
          ),
        );
      } else {
        Navigator.pop(context);
      }

      showSnackBar(AppLocalizations.of(context)!.flashcardCreate, context);
    } on FlashCardNameBusy {
      loading = false;
      notifyListeners();
      showSnackBarError(flashcardNameBusy, context);
    } on TooShort {
      loading = false;
      notifyListeners();
      showSnackBarError(flashcardTooShort, context);
    } catch (_) {
      loading = false;
      notifyListeners();
      return;
    }

    loading = false;
    notifyListeners();
  }

  Future<void> _checkFlashCardName() async {
    var ownFlashcard = user.ownFlashcard;
    if (ownFlashcard == null || ownFlashcard.isEmpty) {
      return;
    }

    for (var element in ownFlashcard) {
      var docRef = await FirebaseFirestore.instance.doc(element).get();
      var flashcardSet =
          FlashCardSet.fromJson(docRef.data() as Map<String, dynamic>);
      if (flashcardSet.flashcard.nameSet == nameController.text) {
        throw FlashCardNameBusy();
      }
    }
  }
}
