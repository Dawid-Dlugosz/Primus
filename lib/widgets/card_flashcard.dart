import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardFlashcard extends StatefulWidget {
  const CardFlashcard({Key? key}) : super(key: key);

  @override
  State<CardFlashcard> createState() => _CardFlashcardState();
}

class _CardFlashcardState extends State<CardFlashcard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        width: double.infinity,
        height: 100,
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(AppLocalizations.of(context)!.nameFlashcardSet('test')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.flashCardWordsCount(10)),
                    Text(AppLocalizations.of(context)!.flashCardWordsCount(10)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
