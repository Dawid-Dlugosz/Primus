import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/exception/flashcard_name_busy.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/flashcard_set.dart';
import 'package:primus/model/user.dart' as myUser;
import 'package:primus/model/word.dart';
import 'package:primus/utils/firebase_error.dart';
import 'package:primus/utils/language_provider.dart';
import 'package:primus/utils/popup.dart';
import 'package:primus/widgets/create_flashcard_widget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class FlashcardViewModel extends ChangeNotifier {
  FlashcardViewModel(this.context, {this.flashCardSet}) {
    _init();
    generateTextField();
  }

  final BuildContext context;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  FlashCardSet? flashCardSet;

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

    var locale = Provider.of<LanguageProvider>(context, listen: false).currentLocale;
    appLocalizations = await AppLocalizations.delegate.load(locale);

    uid = FirebaseAuth.instance.currentUser!.uid;
    var document = await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(uid).get();
    user = myUser.User.fromJson(document.data()!);

    loading = false;
    notifyListeners();
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

  Future<void> createFlashcardSet() async {
    loading = true;
    notifyListeners();

    try {
      await _checkFlashCardName();
      List<Word> words = [];
      for (int i = 0; i < wordFields.length; i++) {
        words.add(Word(
          id: const Uuid().v4(),
          word: wordControllers[i].text,
          definition: definitionControllers[i].text,
        ));
      }
      var flashcardId = const Uuid().v4();
      var flascard = Flashcard(
        id: flashcardId,
        languageSet: languageController.text,
        nameSet: nameController.text,
        words: words,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
      );

      var flashCardSet = FlashCardSet(flashcard: flascard, owner: user.uid);

      await FirebaseFirestore.instance.collection(FirebaseCollection.flashcardSet.name).doc(flashcardId).set(flashCardSet.toJson());

      var document = 'flashcardSet/$flashcardId';

      if (user.ownFlashcard == null) {
        user = user.copyWith(ownFlashcard: [document]);
        await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(user.uid).update({'ownFlashcard': user.ownFlashcard!.map((e) => e).toList()});
      } else {
        var newOwnFlashcard = user.ownFlashcard;
        newOwnFlashcard!.add(document);

        user = user.copyWith(ownFlashcard: newOwnFlashcard);
        await FirebaseFirestore.instance.collection(FirebaseCollection.users.name).doc(user.uid).update({'ownFlashcard': user.ownFlashcard!.map((e) => e).toList()});
      }
      Navigator.pop(context);
      showSnackBar(AppLocalizations.of(context)!.flashcardCreate, context);
    } on FlashCardNameBusy {
      loading = false;
      notifyListeners();
      showSnackBarError(flashcardNameBusy, context);
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
      var flashcardSet = FlashCardSet.fromJson(docRef.data() as Map<String, dynamic>);
      if (flashcardSet.flashcard.nameSet == nameController.text) {
        throw FlashCardNameBusy();
      }
    }
  }
}
