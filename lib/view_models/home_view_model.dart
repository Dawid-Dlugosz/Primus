import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
  HomeViewModel(this.context);

  final BuildContext context;

  bool loading = false;
}