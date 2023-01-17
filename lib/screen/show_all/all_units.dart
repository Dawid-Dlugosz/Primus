import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/unit.dart';
import 'package:primus/widgets/empty_widget.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:primus/widgets/unit_item.dart';

class AllUnits extends StatelessWidget {
  const AllUnits({required this.delete, Key? key}) : super(key: key);

  final Function(String id) delete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.allSets),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection(FirebaseCollection.unit.name).where('owner', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          }
          if (snapshot.hasData && snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var unitDocument = snapshot.data!.docs[index].data();
                var unit = Unit.fromJson(unitDocument);
                return UnitItem(unit: unit, delete: delete);
              },
            );
          }
          return const EmptyWidget();
        },
      ),
    );
  }
}
