import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/exception/flashcard_name_busy.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/utils/language_provider.dart';
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

  bool loading = false;

  List<TextEditingController> wordControllers = [];
  List<TextEditingController> definitionControllers = [];
  List<TextFormField> wordFields = [];
  List<TextFormField> definitionFields = [];

  late List<CreateFlashcardWidget> flashcards;
  late AppLocalizations appLocalizations;
  late CollectionReference docs;
  late String uid;

  _init() async {
    loading = true;
    notifyListeners();
    var locale = Provider.of<LanguageProvider>(context, listen: false).currentLocale;
    docs = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name);
    uid = FirebaseAuth.instance.currentUser!.uid;
    appLocalizations = await AppLocalizations.delegate.load(locale);
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

    //TODO CHECK NAME SET OF FLASHCART EXIST
    try {
      await checkName();
    } catch (e) {
      loading = false;
      notifyListeners();
    }
    // Add timestamp to set of flashcards
    Map<String, dynamic> json = {};
    json['timestamp'] = DateTime.now().millisecondsSinceEpoch;
    docs.doc(uid).set(json);

    // Add every single flashcard to set of flashcards
    for (int i = 0; i < wordFields.length; i++) {
      var json = Flashcard(wordControllers[i].text, definitionControllers[i].text).toJson();
      docs.doc(uid).collection(nameController.text).add(json);
    }
    loading = false;
    notifyListeners();

    //TODO RETRUN TO HOME PAGE WITH SUCCES INFO IN SNACK BAR
  }

  Future<void> checkName() async {
    var document = await FirebaseFirestore.instance.collection(FirebaseCollection.nickname.name).doc(uid).get();
    var collection = await document.reference.collection(nameController.text).get();

    if (collection.size != 0) {
      throw FlashCardNameBusy();
    }
  }
}
