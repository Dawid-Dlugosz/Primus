import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void snakBarInfo({required BuildContext context, required String text}) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(fontSize: 20),
    ),
    action: SnackBarAction(
      onPressed: () {},
      label: AppLocalizations.of(context)!.ok,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
