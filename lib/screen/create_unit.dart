import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../view_models/create_unit_view_model.dart';
import '../widgets/empty_widget.dart';
import '../core/screens/loading_widget.dart';
import '../widgets/unit_chips.dart';
import 'package:provider/provider.dart';

class CreateUnit extends StatefulWidget {
  CreateUnit({Key? key}) : super(key: key);

  @override
  State<CreateUnit> createState() => _CreateUnitState();
}

class _CreateUnitState extends State<CreateUnit> {
  final nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateUnitViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.unit != null && nameController.text.isEmpty) {
          nameController.text = viewModel.unit!.name;
        }

        return viewModel.loaded
            ? Scaffold(
                appBar: AppBar(
                  title: Text(AppLocalizations.of(context)!.createUnit),
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .enterNameUnit;
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                  AppLocalizations.of(context)!.selectSets),
                            ),
                            viewModel.flashcards.isNotEmpty
                                ? Wrap(
                                    spacing: 8.0,
                                    children: [
                                      ...viewModel.flashcards
                                          .map(
                                            (e) => UnitChips(
                                              name: e.flashcard.nameSet,
                                              addFlashcard: () =>
                                                  viewModel.addToUnit(e),
                                              selected: viewModel
                                                  .flascardsAddToUnit
                                                  .any((element) =>
                                                      element.flashcard.id ==
                                                      e.flashcard.id),
                                            ),
                                          )
                                          .toList(),
                                    ],
                                  )
                                : const EmptyWidget(),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (viewModel.unit == null) {
                                  viewModel.saveUnit(nameController.text);
                                } else {
                                  viewModel.editUnit(nameController.text);
                                }
                              }
                            },
                            child: Text(AppLocalizations.of(context)!.save),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : const LoadingWidget();
      },
    );
  }
}
