import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocate = const Locale('en');

  Locale get currentLocale => _currentLocate;

  void changeLocale(String locale) {
    _currentLocate = Locale(locale);
    notifyListeners();
  }
}
