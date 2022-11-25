import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CopyFlashcard extends StatelessWidget {
  const CopyFlashcard({required this.add, Key? key}) : super(key: key);

  final VoidCallback add;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.copyFlashcard,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.no),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    add();
                  },
                  child: Text(AppLocalizations.of(context)!.yes),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
