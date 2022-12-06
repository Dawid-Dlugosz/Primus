import 'package:flutter/material.dart';
import 'package:primus/view_models/flashcard_learn_view_model.dart';

class FlashcardLearnSettings extends StatefulWidget {
  FlashcardLearnSettings({required this.showOnlyUnknow, required this.learnOneMoreTime, Key? key}) : super(key: key);
  bool showOnlyUnknow;
  final VoidCallback learnOneMoreTime;
  @override
  State<FlashcardLearnSettings> createState() => _FlashcardLearnSettingsState();
}

class _FlashcardLearnSettingsState extends State<FlashcardLearnSettings> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SwitchListTile(
        title: const Text('Pokazuj wszystkie słowa'),
        subtitle: const Text('Nawet te znane'),
        value: !widget.showOnlyUnknow,
        onChanged: (value) {
          setState(() {
            widget.showOnlyUnknow = !value;
            widget.learnOneMoreTime();
          });
        },
      ),
    );
  }
}
