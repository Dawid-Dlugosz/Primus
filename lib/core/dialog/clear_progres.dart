import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClearProgress extends StatelessWidget {
  const ClearProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.clearProgress),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(AppLocalizations.of(context)!.yes),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(AppLocalizations.of(context)!.no),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
