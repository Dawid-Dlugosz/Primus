import 'package:flutter/material.dart';
import '../../features/auth/utils/firebase_error.dart';

void showSnackBarError(String errorCode, BuildContext context) {
  var snackBar = SnackBar(content: Text(errorCodeToText(errorCode, context)));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSnackBar(String info, BuildContext context) {
  var snackBar = SnackBar(content: Text(info));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
