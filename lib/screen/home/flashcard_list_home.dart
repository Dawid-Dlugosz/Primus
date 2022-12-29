import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/screen/show_all/all_flascard.dart';
import 'package:primus/view_models/all_flashcard_view_model.dart';
import 'package:primus/widgets/card_flashcard.dart';
import 'package:provider/provider.dart';

class FlashcardListHome extends StatefulWidget {
  const FlashcardListHome({required this.flashcards, required this.uid, required this.delte, Key? key}) : super(key: key);

  final List<Flashcard> flashcards;
  final String uid;
  final Function(String flashcardId) delte;

  @override
  State<FlashcardListHome> createState() => _FlashcardListHomeState();
}

class _FlashcardListHomeState extends State<FlashcardListHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.sets),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.flashcards.take(3).length,
          itemBuilder: (context, index) {
            // TODO PORPAWIĆ USUSWANIE U KAŻDEGO UŻYTKOWNIKA KTÓRY W TO LEARN MA ID USUWANEGO ZESTAWU MUSI ZOSTAĆ USUNIĘTE
            return CardFlashcard(
              flashcard: widget.flashcards[index],
              delete: widget.delte,
            );
          },
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (context) => AllFlashCardViewModel(context: context),
                    child: const AllFlashcard(),
                  ),
                ),
              );
            },
            child: Text(AppLocalizations.of(context)!.showMore),
          ),
        ),
      ],
    );
  }
}
