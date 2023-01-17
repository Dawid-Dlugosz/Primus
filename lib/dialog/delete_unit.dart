import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteUnit extends StatelessWidget {
  const DeleteUnit({required this.delete, Key? key}) : super(key: key);

  final VoidCallback delete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)!.unitDelete),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text(AppLocalizations.of(context)!.no)),
              ElevatedButton(onPressed: delete, child: Text(AppLocalizations.of(context)!.yes)),
            ],
          )
        ],
      ),
    );
  }
}
