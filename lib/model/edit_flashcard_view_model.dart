import 'package:flutter/material.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/utils/language_provider.dart';
import 'package:primus/widgets/create_flashcard_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EditFlashcardViewModel extends ChangeNotifier {
  EditFlashcardViewModel({required this.flashcard, required this.context}) {
    _inti();
  }

  final Flashcard flashcard;
  final BuildContext context;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController languageController = TextEditingController();

  bool loaded = false;

  List<TextEditingController> wordControllers = [];
  List<TextEditingController> definitionControllers = [];
  List<TextFormField> wordFields = [];
  List<TextFormField> definitionFields = [];

  late List<CreateFlashcardWidget> flashcardsWidget;
  late AppLocalizations appLocalizations;

  Future<void> _inti() async {
    var locale = Provider.of<LanguageProvider>(context, listen: false).currentLocale;
    nameController.text = flashcard.nameSet;
    languageController.text = flashcard.languageSet;
    
    appLocalizations = await AppLocalizations.delegate.load(locale);

    flashcard.words.forEach((element) {
      generateTextField(wordText: element.word, definitionText: element.definition);
    });
    loaded = true;
    notifyListeners();
  }

  void removeFlashcard(int index) {
    wordControllers.removeAt(index);
    definitionControllers.removeAt(index);
    wordFields.removeAt(index);
    definitionFields.removeAt(index);
    notifyListeners();
  }

  void generateTextField({String? wordText, String? definitionText}) {
    var wordController = TextEditingController();
    var definitionController = TextEditingController();

    if (wordText != null) {
      wordController.text = wordText;
    }

    if (definitionText != null) {
      definitionController.text = definitionText;
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
}
