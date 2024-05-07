import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateFlashcardWidget extends StatelessWidget {
  const CreateFlashcardWidget(
      {super.key,
      required this.wordController,
      required this.definitionController,
      required this.removeFlashcard});

  final TextEditingController wordController;
  final TextEditingController definitionController;
  final VoidCallback removeFlashcard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => removeFlashcard(),
              ),
            ),
            TextFormField(
              controller: wordController,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.wordHint,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.wordHint;
                }
                return null;
              },
            ),
            TextFormField(
              controller: definitionController,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.definitionHint,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.definitionHint;
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
