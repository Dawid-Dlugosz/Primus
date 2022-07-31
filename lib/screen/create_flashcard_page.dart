import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/view_models/create_flashcard_view_model.dart';
import 'package:primus/widgets/create_flashcard_widget.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class CreateFlashcardPage extends StatefulWidget {
  const CreateFlashcardPage({Key? key}) : super(key: key);

  @override
  State<CreateFlashcardPage> createState() => _CreateFlashcardPageState();
}

class _CreateFlashcardPageState extends State<CreateFlashcardPage> {
  late FlashcardViewModel fVIewModel;

  @override
  void dispose() {
    super.dispose();
    for (var element in fVIewModel.definitionControllers) {
      element.dispose();
    }

    for (var element in fVIewModel.wordControllers) {
      element.dispose();
    }

    fVIewModel.nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardViewModel>(builder: (_, viewModel, __) {
      fVIewModel = viewModel;
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.flashcards),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                if (viewModel.formKey.currentState!.validate()) {
                  viewModel.createFlashcardSet();
                } else {
                  viewModel.checkName();
                }
              },
              child: Icon(Icons.save),
            ),
            SizedBox(height: 15),
            FloatingActionButton(
              onPressed: () {
                viewModel.generateTextField();
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
        body: !viewModel.loading
            ? Form(
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
              )
            : LoadingWidget(),
      );
    });
  }
}
