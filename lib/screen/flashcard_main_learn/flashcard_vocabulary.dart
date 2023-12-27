import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/screens/loading_widget.dart';
import '../../core/widgets/custom_error_widget.dart';
import '../../features/vocabulary/presentation/vocabulary/vocabulary_cubit.dart';
import '../../widgets/swiper_tinder/swiper_empty.dart';
import '../../widgets/swiper_tinder/swiper_tinder.dart';

class FlashcardVocabulary extends StatelessWidget {
  const FlashcardVocabulary({required this.language, super.key});

  final String language;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VocabularyCubit, VocabularyState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (value) {
            final vocabulary = value.vocabulary;
            return Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  vocabulary.know.isNotEmpty
                      ? SwiperTinder(
                          words: vocabulary.know,
                          language: language,
                        )
                      : const SwiperEmpty(),
                  vocabulary.unknow.isNotEmpty
                      ? SwiperTinder(
                          words: vocabulary.unknow,
                          language: language,
                        )
                      : const SwiperEmpty(),
                ],
              ),
            );
          },
          loading: (_) => const LoadingWidget(),
          orElse: () => const CustomErrorWidget(),
        );
      },
    );
  }
}
