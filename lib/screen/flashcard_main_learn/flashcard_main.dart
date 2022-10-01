import 'package:flutter/material.dart';
import 'package:primus/view_models/flashcard_learn_view_model.dart';
import 'package:primus/widgets/swiper/swiper_wrapper.dart';
import 'package:provider/provider.dart';

class FlashCardMain extends StatefulWidget {
  const FlashCardMain({Key? key}) : super(key: key);

  @override
  State<FlashCardMain> createState() => _FlashCardMainState();
}

List<Widget> widgets = [
  Text('Texkt 1'),
  Text('Telst 2'),
  Text('Tekst 3'),
  Text('Tekst 4'),
  Text('Tekst 5'),
];

class _FlashCardMainState extends State<FlashCardMain> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardLearnViewModel>(
      builder: ((context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(viewModel.flashcard.nameSet),
          ),
          body: SwiperWrapper(childrens: widgets),
        );
      }),
    );
  }
}
