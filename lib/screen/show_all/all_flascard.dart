import 'package:flutter/material.dart';
import 'package:primus/model/flashcard.dart';
import 'package:primus/view_models/all_flashcard_view_model.dart';
import 'package:primus/widgets/card_flashcard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/widgets/empty_widget.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class AllFlashcard extends StatelessWidget {
  const AllFlashcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AllFlashCardViewModel>(
      builder: (context, viewModel, child) {
        return viewModel.loaded
            ? Scaffold(
                appBar: AppBar(
                  title: Text(AppLocalizations.of(context)!.allSets),
                ),
                body: StreamBuilder<List<Flashcard>>(
                  stream: Stream.fromFuture(viewModel.getUserFlahscards()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingWidget();
                    }
                    if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return CardFlashcard(
                            flashcard: snapshot.data![index],
                            delete: viewModel.deleteFlashcard,
                          );
                        },
                      );
                    }
                    return const EmptyWidget();
                  },
                ),
              )
            : const LoadingWidget();
      },
    );
  }
}