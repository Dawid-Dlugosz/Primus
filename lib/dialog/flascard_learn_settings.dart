import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primus/view_models/flashcard_learn_view_model.dart';

class FlashcardLearnSettings extends StatefulWidget {
  const FlashcardLearnSettings({required this.viewModel, Key? key}) : super(key: key);
  final FlashcardLearnViewModel viewModel;

  @override
  State<FlashcardLearnSettings> createState() => _FlashcardLearnSettingsState();
}

class _FlashcardLearnSettingsState extends State<FlashcardLearnSettings> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SwitchListTile(
        title: Text('Pokazuj wszystkie słowa'),
        subtitle: Text('Nawet te znane'),
        value: !widget.viewModel.showOnlyUnknow,
        onChanged: (value) {
          setState(() {
            widget.viewModel.showOnlyUnknow = !value;
            widget.viewModel.learnOneMoreTime();
          });
        },
      ),
    );
  }
}
