import 'package:flutter/material.dart';
import '../../dialog/clear_progres.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyWords extends StatelessWidget {
  const EmptyWords({
    required this.clearProgress,
    super.key,
  });

  final VoidCallback clearProgress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.knowAll,
        ),
        ElevatedButton(
          child: Text(AppLocalizations.of(context)!.firstChoice),
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return const ClearProgress();
              },
            ).then((value) {
              var isReset = value as bool;
              if (isReset) {
                clearProgress();
              }
            });
          },
        ),
        ElevatedButton(
          onPressed: Navigator.of(context).pop,
          child: Text(
            AppLocalizations.of(context)!.secondChoice,
          ),
        ),
      ],
    );
  }
}
