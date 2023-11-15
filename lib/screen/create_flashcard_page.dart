import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/create_flashcard_widget.dart';

class CreateFlashcardPage extends StatefulWidget {
  const CreateFlashcardPage({super.key});

  @override
  State<CreateFlashcardPage> createState() => _CreateFlashcardPageState();
}

class _CreateFlashcardPageState extends State<CreateFlashcardPage> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController nameController;
  late final TextEditingController languageController;
  late final List<TextFormField> wordsFields;
  late final List<TextFormField> definitionsFields;

  void removeWorField(index) {
    setState(() {
      wordsFields.removeAt(index);
      definitionsFields.removeAt(index);
    });
  }

  void createWordFields({String? wordText, String? definitionText}) {
    final wordController = TextEditingController();
    final definitionController = TextEditingController();

    definitionController.text = definitionText ?? '';
    wordController.text = wordText ?? '';

    var word = TextFormField(
      controller: wordController,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.wordHint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.flashcardsNameError;
        }
        return null;
      },
    );

    var definition = TextFormField(
      controller: definitionController,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.definitionHint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.flashcardsNameError;
        }
        return null;
      },
    );
    setState(() {
      wordsFields.add(word);
      definitionsFields.add(definition);
    });
  }

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    languageController = TextEditingController();

    wordsFields = [];
    definitionsFields = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.flashcards),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'Create',
            onPressed: () {
              // TODO CREATE FLASHCARD SET
              // if (viewModel.formKey.currentState!.validate()) {
              //   if (viewModel.edit) {
              //     viewModel.editFlashcardSet();
              //   } else {
              //     viewModel.createFlashcardSet();
              //   }
              // }
            },
            child: const Icon(Icons.save),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: 'Add',
            onPressed: () {
              createWordFields();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body:
          //  !viewModel.loading
          //     ?
          Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.flashcardsName,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.drive_file_rename_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.flashcardsNameError;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: languageController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.flashcardsLanguage,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.language),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.flashcardLanguageError;
                  }
                  return null;
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: wordsFields.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CreateFlashcardWidget(
                      removeFlashcard: () => removeWorField(index),
                      definitionField: definitionsFields[index],
                      wordField: wordsFields[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
