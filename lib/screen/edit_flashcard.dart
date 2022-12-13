import 'package:flutter/material.dart';
import 'package:primus/model/edit_flashcard_view_model.dart';
import 'package:primus/widgets/create_flashcard_widget.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditFlascard extends StatefulWidget {
  const EditFlascard({Key? key}) : super(key: key);

  @override
  State<EditFlascard> createState() => _EditFlascardState();
}

class _EditFlascardState extends State<EditFlascard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EditFlashcardViewModel>(
      builder: (context, viewModel, child) {
        return viewModel.loaded
            ? Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  title: Text('Edytuj zestaw: ${viewModel.flashcard.nameSet}'),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.save),
                ),
                body: Form(
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
                            return AppLocalizations.of(context)!.flashcardsNameError;
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: viewModel.languageController,
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
                      )
                    ],
                  ),
                ),
              )
            : const LoadingWidget();
      },
    );
  }
}
