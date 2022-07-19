import 'package:flutter/material.dart';
import 'package:primus/screen/start_page.dart';
import 'package:primus/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light,
      home: StartPage(),
    );
  }
}
