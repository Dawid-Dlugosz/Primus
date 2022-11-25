import 'package:primus/model/word.dart';

class SplitWords {
  SplitWords({required this.allKnowWords, required this.allUnknowWords});

  List<Word> allKnowWords;
  List<Word> allUnknowWords;
}
