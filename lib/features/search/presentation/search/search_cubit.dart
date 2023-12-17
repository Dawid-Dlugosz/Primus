// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../create_flashcard/domain/entity/flashcard_set.dart';
import '../../domain/repository/search_repository.dart';

class SearchCubit extends Cubit<List<FlashcardSet>> {
  SearchCubit({required this.repository}) : super([]);

  final SearchRepository repository;
  final Logger logger = Logger();

  void searchFlashcard({required String name}) async {
    final result = await repository.getSnapshot();

    result.fold(
      (l) => emit([]),
      (stream) {
        stream.listen((event) {
          final flashcardSets = _parseElements(event, name);
          emit(flashcardSets);
        });
      },
    );
  }

  List<FlashcardSet> _parseElements(
    QuerySnapshot<Map<String, dynamic>> querySnapshot,
    String name,
  ) {
    try {
      final flashcardSets = <FlashcardSet>[];

      for (var element in querySnapshot.docs) {
        final data = element.data();

        final flashcardSet = FlashcardSet.fromJson(data);
        flashcardSets.add(flashcardSet);
      }

      return flashcardSets
          .where((e) =>
              e.flashCard.nameSet.toLowerCase().contains(name.toLowerCase()))
          .toList();
    } catch (e, s) {
      logger.f(
        'SearchCubit _parseElements',
        error: e,
        stackTrace: s,
      );
      return [];
    }
  }
}
