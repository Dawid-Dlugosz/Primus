import '../enum/shared_preferenced_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getFlashcardSettingsKnowWord() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(PreferencedName.showOnlyUnknow.name) ?? true;
}

Future<void> setFlashcardSettingsKnowWord(bool value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(PreferencedName.showOnlyUnknow.name, value);
}
