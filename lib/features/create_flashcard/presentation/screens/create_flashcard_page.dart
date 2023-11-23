import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/features/create_flashcard/presentation/create_flashcard/create_flashcard_cubit.dart';
import 'package:primus/core/screens/loading_widget.dart';
import '../../../../widgets/create_flashcard_widget.dart';

class CreateFlashcardPage extends StatefulWidget {
  const CreateFlashcardPage({super.key});

  @override
  State<CreateFlashcardPage> createState() => _CreateFlashcardPageState();
}

class _CreateFlashcardPageState extends State<CreateFlashcardPage> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController nameController;
  late final TextEditingController languageController;
  // late final List<TextFormField> wordsFields;
  // late final List<TextFormField> definitionsFields;
  late final List<TextEditingController> wordsController;
  late final List<TextEditingController> definitionsController;

  void removeWorField(index) {
    setState(() {
      // wordsFields.removeAt(index);
      // definitionsFields.removeAt(index);
      wordsController.remove(index);
      definitionsController.remove(index);
    });
  }

  void createWordFields({String? wordText, String? definitionText}) {
    final wordController = TextEditingController();
    final definitionController = TextEditingController();

    definitionController.text = definitionText ?? '';
    wordController.text = wordText ?? '';

    setState(() {
      wordsController.add(wordController);
      definitionsController.add(definitionController);
      // wordsFields.add(word);
      // definitionsFields.add(definition);
    });
  }

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    languageController = TextEditingController();

    wordsController = [];
    definitionsController = [];
    // wordsFields = [];
    // definitionsFields = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateFlashcardCubit, CreateFlashcardState>(
      listener: (context, state) {
        state.maybeMap(
          success: (value) {
            // TODO MAKE USER REPOSITORY AND INSERT VALUES TO FIRESTORE AND BACK TO MAIN SCREEN
          },
          error: (value) {
            // TODO MAKE SNACKBAR WHEN IS ERROR
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.flashcards),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'Create',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<CreateFlashcardCubit>().createFlashcardSet(
                        name: nameController.text,
                        language: languageController.text,
                        words: wordsController,
                        definitions: wordsController,
                      );
                }
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
        body: BlocBuilder<CreateFlashcardCubit, CreateFlashcardState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context)!.flashcardsName,
                            border: const OutlineInputBorder(),
                            prefixIcon:
                                const Icon(Icons.drive_file_rename_outline),
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
                          controller: languageController,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!
                                .flashcardsLanguage,
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
                            itemCount: wordsController.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CreateFlashcardWidget(
                                removeFlashcard: () => removeWorField(index),
                                definitionController:
                                    definitionsController[index],
                                wordController: wordsController[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              loadind: (_) => const LoadingWidget(),
            );
          },
        ),
      ),
    );
  }
}
