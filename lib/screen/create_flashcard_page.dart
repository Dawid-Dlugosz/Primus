import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../view_models/create_flashcard_view_model.dart';
import '../widgets/create_flashcard_widget.dart';

import 'package:provider/provider.dart';

class CreateFlashcardPage extends StatefulWidget {
  const CreateFlashcardPage({super.key});

  @override
  State<CreateFlashcardPage> createState() => _CreateFlashcardPageState();
}

class _CreateFlashcardPageState extends State<CreateFlashcardPage> {
  late FlashcardViewModel model;

  @override
  void dispose() {
    super.dispose();
    for (var element in model.definitionControllers) {
      element.dispose();
    }

    for (var element in model.wordControllers) {
      element.dispose();
    }

    model.nameController.dispose();
    model.languageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardViewModel>(builder: (_, viewModel, __) {
      model = viewModel;
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
                  if (viewModel.formKey.currentState!.validate()) {
                    if (viewModel.edit) {
                      viewModel.editFlashcardSet();
                    } else {
                      viewModel.createFlashcardSet();
                    }
                  }
                },
                child: const Icon(Icons.save),
              ),
              const SizedBox(height: 15),
              FloatingActionButton(
                heroTag: 'Add',
                onPressed: () {
                  viewModel.generateTextField();
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
              key: viewModel.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: viewModel.nameController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.flashcardsName,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.drive_file_rename_outline),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!
                            .flashcardsNameError;
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: viewModel.languageController,
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context)!.flashcardsLanguage,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.language),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!
                            .flashcardLanguageError;
                      }
                      return null;
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.wordFields.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CreateFlashcardWidget(
                          removeFlashcard: () {
                            viewModel.removeFlashcard(index);
                          },
                          definitionField: viewModel.definitionFields[index],
                          wordField: viewModel.wordFields[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
          // : const LoadingWidget(),
          );
    });
  }
}
