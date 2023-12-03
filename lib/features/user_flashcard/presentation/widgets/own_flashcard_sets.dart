import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OwnFlashcardSets extends StatelessWidget {
  const OwnFlashcardSets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.sets,
        ),
      ],
    );
  }
}
