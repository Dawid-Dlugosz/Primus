import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SwiperEmpty extends StatelessWidget {
  const SwiperEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 200,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                spreadRadius: -7,
                blurRadius: 16,
                color: Color.fromRGBO(0, 0, 0, 1),
              )
            ]),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            AppLocalizations.of(context)!.swiperEmpty,
            style: const TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
