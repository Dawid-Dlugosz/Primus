import 'package:flutter/material.dart';
import 'package:primus/dialog/flascard_learn_settings.dart';
import 'package:primus/screen/test/spelling_card.dart';
import 'package:primus/utils/shared_preferences.dart';

class FlashcardExam extends StatefulWidget {
  const FlashcardExam({Key? key}) : super(key: key);

  @override
  State<FlashcardExam> createState() => _FlashcardExamState();
}

class _FlashcardExamState extends State<FlashcardExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Tryb nauki: Test'),
            InkWell(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return FlashcardLearnSettings(
                      // TODO PRZEROBIĆ TO TAK ŻEBY NIE PRZEKAZYWAC SHOWONLYUNKNOW TYLKO FUKNCJĘ KTÓRA ZMIENIA JEJ WARTOŚĆ
                      showOnlyUnknow: true,
                      learnOneMoreTime: () {},
                    );
                  },
                ).then((value) async {
                  await setFlashcardSettingsKnowWord(true);
                });
              },
              child: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: SpellingCard(word: 'Pies'),
    );
  }
}
