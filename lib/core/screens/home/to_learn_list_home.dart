import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/core/widgets/card_to_learn.dart';
import 'package:primus/features/user/domain/entity/to_learn.dart';

import 'show_all/all_to_learn.dart';

class ToLearnListHome extends StatelessWidget {
  const ToLearnListHome({required this.toLearns, super.key});

  final List<ToLearn> toLearns;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.sets),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: toLearns.take(3).length,
          itemBuilder: (context, index) {
            return CardToLearn(
              toLearn: toLearns[index],
            );
          },
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllToLearn(),
                ),
              );
            },
            child: Text(AppLocalizations.of(context)!.showMore),
          ),
        )
      ],
    );
  }
}
