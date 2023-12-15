import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/features/create_flashcard/presentation/create_flashcard/cud_flashcard_cubit.dart';
import 'package:primus/core/screens/loading_widget.dart';
import 'package:primus/features/user/presentation/cubit/cubit/user_cubit.dart';
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
  late final List<TextEditingController> wordsController;
  late final List<TextEditingController> definitionsController;

  void removeWorField(index) {
    setState(() {
      wordsController.removeAt(index);
      definitionsController.removeAt(index);
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
    });
  }

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    languageController = TextEditingController();

    generateControllers();
    super.initState();
  }

  @override
  void dispose() {
    wordsController.clear();
    definitionsController.clear();
    nameController.clear();
    languageController.clear();
    super.dispose();
  }

  void generateControllers() {
    wordsController = [];
    definitionsController = [];
    for (var i = 0; i < 4; i++) {
      wordsController.add(TextEditingController());
      definitionsController.add(TextEditingController());
    }
  }

  void createSnackBar(CreateFlashcardError error) {
    var textMessage = "";

    switch (error) {
      case CreateFlashcardError.nameBusy:
        textMessage = AppLocalizations.of(context)!.nameIsbusy;
        break;
      case CreateFlashcardError.tooShort:
        textMessage = AppLocalizations.of(context)!.flashcardShort;
        break;
      default:
        textMessage = AppLocalizations.of(context)!.error;
        break;
    }
    final snackBar = SnackBar(
      content: Text(
        textMessage,
        style: const TextStyle(fontSize: 18),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CUDFlashcardCubit, CUDFlashcardState>(
      listener: (context, state) {
        state.maybeMap(
          success: (value) {
            Navigator.pop(context);
            context.read<UserCubit>().addFlashcardSetToUser(
                  flashcardSetId: value.flashcardSetId,
                );
            final snackbar = SnackBar(
              content: Text(
                AppLocalizations.of(context)!.flashcardCreate,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          error: (value) {
            createSnackBar(value.errorMessage);
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
                  context.read<CUDFlashcardCubit>().createFlashcardSet(
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
        body: BlocBuilder<CUDFlashcardCubit, CUDFlashcardState>(
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
