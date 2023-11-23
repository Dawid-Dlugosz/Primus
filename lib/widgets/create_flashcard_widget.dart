import 'package:flutter/material.dart';

class CreateFlashcardWidget extends StatefulWidget {
  const CreateFlashcardWidget(
      {super.key,
      required this.wordField,
      required this.definitionField,
      required this.removeFlashcard});

  final TextFormField wordField;
  final TextFormField definitionField;
  final VoidCallback removeFlashcard;

  @override
  State<CreateFlashcardWidget> createState() => _CreateFlashcardWidgetState();
}

class _CreateFlashcardWidgetState extends State<CreateFlashcardWidget> {
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
                onPressed: () {
                  widget.removeFlashcard();
                },
              ),
            ),
            widget.wordField,
            widget.definitionField,
          ],
        ),
      ),
    );
  }
}
