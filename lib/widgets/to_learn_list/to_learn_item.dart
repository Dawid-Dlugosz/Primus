import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:primus/dialog/delete_to_learn.dart';
import 'package:primus/model/flashcard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/screen/flashcard_main_learn/flashcard_main.dart';
import 'package:primus/view_models/flashcard_main_view_model.dart';
import 'package:provider/provider.dart';

class ToLearnItem extends StatelessWidget {
  const ToLearnItem({required this.flashcard, required this.timeStamp, required this.delete, Key? key}) : super(key: key);

  final Flashcard flashcard;
  final int timeStamp;
  final Function(String flashcardId) delete;

  String convertTimeStamp(int timeStamp) {
    var dt = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return DateFormat('dd-MM-yy').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => FlashcardMainViewModel(flascardId: flashcard.id),
              child: const FlashCardMain(),
            ),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.nameFlashcardSet(flashcard.nameSet)),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'Delete',
                          child: Text(AppLocalizations.of(context)!.delete),
                        ),
                      ],
                      onSelected: (value) {
                        showDialog(
                          context: context,
                          builder: (context) => DeleteToLearn(
                            delete: () => delete(flashcard.id),
                          ),
                        );
                      },
                      child: const Icon(Icons.more_vert),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.lastUpdate(convertTimeStamp(timeStamp))),
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
