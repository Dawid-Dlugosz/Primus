import 'package:flutter/material.dart';

class CreateFlashcardWidget extends StatefulWidget {
  const CreateFlashcardWidget({Key? key, required this.wordField, required this.definitionField, required this.removeFlashcard}) : super(key: key);

  final TextFormField wordField;
  final TextFormField definitionField;
  final VoidCallback removeFlashcard;

  @override
  State<CreateFlashcardWidget> createState() => _CreateFlashcardWidgetState();
}

class _CreateFlashcardWidgetState extends State<CreateFlashcardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                widget.removeFlashcard();
              },
            ),
          ),
          widget.wordField,
          widget.definitionField,
        ],
      ),
    );
  }
}
