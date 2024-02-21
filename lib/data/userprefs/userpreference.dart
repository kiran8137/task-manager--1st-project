

import 'package:hive/hive.dart';

Future<void> setThemePreference(bool isDarkMode) async {
  final box = await Hive.openBox('preferences');
  //await box.put('theme', Userpreference(isDarkMode: isDarkMode));
}