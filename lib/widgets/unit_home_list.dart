import 'package:flutter/material.dart';
import '../model/unit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../core/screens/home/show_all/all_units.dart';
import 'unit_item.dart';

class UnitHomeList extends StatelessWidget {
  const UnitHomeList({required this.units, required this.delete, super.key});

  final List<Unit> units;
  final Function(String unitId) delete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.units),
        ListView.builder(
          shrinkWrap: true,
          itemCount: units.take(3).length,
          itemBuilder: (context, index) {
            return UnitItem(unit: units[index], delete: delete);
          },
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllUnits(delete: delete)));
            },
            child: Text(AppLocalizations.of(context)!.showMore),
          ),
        ),
      ],
    );
  }
}
