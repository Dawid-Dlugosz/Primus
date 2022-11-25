import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/model/word.dart';
import 'package:primus/widgets/flip_card/flip_flashcard.dart';

class PreviewFlashcard extends StatefulWidget {
  const PreviewFlashcard({required this.saveEdit, required this.learn, required this.words, required this.language, Key? key}) : super(key: key);

  final VoidCallback saveEdit;
  final VoidCallback learn;
  final List<Word> words;
  final String language;

  @override
  State<PreviewFlashcard> createState() => _PreviewFlashcardState();
}

class _PreviewFlashcardState extends State<PreviewFlashcard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () => widget.saveEdit(),
              child: Text('Edytuj i zapisz'),
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: () => widget.learn(),
              child: Text('Ucz się'),
            ),
          ],
        ),
        Swiper(
          loop: true,
          itemCount: widget.words.length,
          itemWidth: MediaQuery.of(context).size.width,
          itemHeight: 200,
          itemBuilder: (context, index) {
            return FLipFlashcard(word: widget.words[index].word, wordDefinition: widget.words[index].definition, language: widget.language);
          },
        ),
      ],
    );
  }
}
