import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../view_models/unit_screen_view_model.dart';
import '../core/screens/loading_widget.dart';
import 'package:provider/provider.dart';

class UnitScreen extends StatelessWidget {
  const UnitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UnitScreenViewModel>(
      builder: ((context, viewModel, child) {
        return viewModel.loaded
            ? Scaffold(
                appBar: AppBar(
                  title: Text(AppLocalizations.of(context)!
                      .nameUnit(viewModel.unit.name)),
                ),
                body: Column(
                  children: [
                    Text(AppLocalizations.of(context)!.sets),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: viewModel.flashcardSets.length,
                      itemBuilder: (context, index) {
                        return const SizedBox();
                        // return CardFlashcard(
                        //   flashcard: viewModel.flashcardSets[index].flashcard,
                        //   fromSearch: true,
                        // );
                      },
                    )
                  ],
                ),
              )
            : const LoadingWidget();
      }),
    );
  }
}
