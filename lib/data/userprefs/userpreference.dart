
import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:manage_your/model/userprefs/userprefs.dart';

Future<void> setThemePreference(bool isDarkMode) async {
  final box = await Hive.openBox('preferences');
  //await box.put('theme', Userpreference(isDarkMode: isDarkMode));
}