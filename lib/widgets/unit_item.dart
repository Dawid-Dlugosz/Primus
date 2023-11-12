import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../dialog/delete_unit.dart';
import '../model/unit.dart';
import '../screen/create_unit.dart';
import '../screen/unit_screen.dart';
import '../view_models/create_unit_view_model.dart';
import '../view_models/unit_screen_view_model.dart';
import 'package:provider/provider.dart';

class UnitItem extends StatelessWidget {
  const UnitItem({required this.unit, required this.delete, Key? key})
      : super(key: key);

  final Unit unit;
  final Function(String unitId) delete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => UnitScreenViewModel(unit: unit),
              child: const UnitScreen(),
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.nameUnit(unit.name)),
              Row(
                children: [
                  Text(AppLocalizations.of(context)!
                      .setsCount(unit.sets.length)),
                  PopupMenuButton(
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'Edit',
                              child: Text(AppLocalizations.of(context)!.edit),
                            ),
                            PopupMenuItem(
                              value: 'Delete',
                              child: Text(AppLocalizations.of(context)!.delete),
                            ),
                          ],
                      onSelected: (value) {
                        if (value == 'Edit') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                create: (context) =>
                                    CreateUnitViewModel(context, unit: unit),
                                child: CreateUnit(),
                              ),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                DeleteUnit(delete: () => delete(unit.id)),
                          );
                        }
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
