import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/utils/colors.dart';

class CustomErrorWidget extends StatefulWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  State<CustomErrorWidget> createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.report_gmailerrorred_outlined,
            color: getIconColor(),
            size: 100,
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Text(
              AppLocalizations.of(context)!.error,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
