import 'package:flutter/material.dart';
import 'package:primus/widgets/bottom_dialog_add.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this.context);

  final BuildContext context;

  bool loading = false;

  void showBottomDialog() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return BottomDialogAdd();
      },
    );
  }
}
