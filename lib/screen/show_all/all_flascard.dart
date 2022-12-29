import 'package:flutter/material.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/widgets/card_flashcard.dart';

class AllFlashcard extends StatelessWidget {
  const AllFlashcard(this.flashcards, {Key? key}) : super(key: key);
  final List<Flashcard> flashcards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wszystkie Zestawy'),
      ),
      body: ListView.builder(
        itemCount: flashcards.length,
        itemBuilder: (context, index) {
          return CardFlashcard(flashcard: flashcards[index]);
        },
      ),
    );
  }
}
