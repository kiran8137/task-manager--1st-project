import 'package:flutter/material.dart';
import 'package:manage_your/utils/apps_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme:  const ColorScheme.light(
    background: Colors.white,
    primary: Colors.white,
    secondary: Colors.blue,
    onSurface: Colors.black
    
  ),
  //primaryColor: const Color.fromARGB(255, 55, 105, 204),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 55, 105, 204),
  ),
  // textTheme: TextTheme(
  //    labelLarge: TextStyle(color: Colors.white),
  //     displayLarge: TextStyle(color: Colors.white),
  //     displayMedium: TextStyle(color: Colors.white),
  //     displaySmall: TextStyle(color: Colors.white),
  //     headlineMedium: TextStyle(color: Colors.white),
  //     headlineSmall: TextStyle(color: Colors.white),
  //     titleLarge: TextStyle(color: Colors.white),
  // )
   textTheme: TextTheme(
    titleSmall: TextStyle(color: Colors.black),
    titleLarge:  TextStyle(color: Colors.black),
    titleMedium: TextStyle(color: Colors.black)
   )
  
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme:  const ColorScheme.dark(
    background: Appcolors.primaryColor,
    primary: Colors.black,
    
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: const TextTheme(
     labelLarge: TextStyle(color: Colors.white), // Change text color for dark mode
    displayLarge: TextStyle(color: Colors.white), // Change text color for dark mode
    displayMedium: TextStyle(color: Colors.white), // Change text color for dark mode
    displaySmall: TextStyle(color: Colors.white), // Change text color for dark mode
    headlineMedium: TextStyle(color: Colors.white), // Change text color for dark mode
    headlineSmall: TextStyle(color: Colors.white), // Change text color for dark mode
    titleLarge: TextStyle(color: Colors.white),
     // Change text color for dark mode
  ),
  
  );
