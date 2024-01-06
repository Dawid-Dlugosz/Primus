import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../features/user/domain/entity/to_learn.dart';
import '../../../widgets/card_to_learn.dart';

class AllToLearn extends StatelessWidget {
  const AllToLearn({required this.toLearns, super.key});

  final List<ToLearn> toLearns;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.toStudy),
      ),
      body: ListView.builder(
        itemCount: toLearns.length,
        itemBuilder: (context, index) {
          return CardToLearn(
            toLearn: toLearns[index],
          );
        },
      ),
    );
  }
}
