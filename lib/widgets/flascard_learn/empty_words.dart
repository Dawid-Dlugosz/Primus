import 'package:flutter/material.dart';
import 'package:primus/dialog/clear_progres.dart';
import 'package:primus/view_models/flashcard_learn_view_model.dart';

class EmptyWords extends StatefulWidget {
  const EmptyWords({required this.viewModel, Key? key}) : super(key: key);
  final FlashcardLearnViewModel viewModel;

  @override
  State<EmptyWords> createState() => _EmptyWordsState();
}

class _EmptyWordsState extends State<EmptyWords> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Z tego kurus umiesz już wszystkie słowa, masz kilka możliowść:'),
        ElevatedButton(
          child: Text('1. Wyzeruj postępy kurus'),
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return ClearProgress();
              },
            ).then((value) {
              var isReset = value as bool;
              if (isReset) {
                widget.viewModel.clearPorgress();
              }
            });
          },
        ),
        ElevatedButton(
          child: Text('2. Pokaż wszystkie słówka'),
          onPressed: widget.viewModel.showAllWords,
        ),
        ElevatedButton(
          child: Text('3. Przejdź do następnego kurus'),
          onPressed: Navigator.of(context).pop,
        ),
      ],
    );
  }
}
