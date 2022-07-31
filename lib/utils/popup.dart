import 'package:flutter/material.dart';
import 'package:primus/utils/firebase_error.dart';

void showSnackBar(String errorCode, BuildContext context) {
  var snackBar = SnackBar(content: Text(errorCodeToText(errorCode, context)));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
