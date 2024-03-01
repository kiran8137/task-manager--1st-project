// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manage_your/model/category_model/category.dart';
import 'package:manage_your/model/task.dart';
import 'package:manage_your/model/userprefs/userprefs.dart';
 
import 'package:manage_your/theme/theme.dart';
import 'package:manage_your/theme/themeprovider.dart';
import 'package:manage_your/views/home/components/search/searchscreen.dart';
import 'package:manage_your/views/home/homeview.dart';
//import 'package:manage_your/views/taskdetail.dart';
import 'package:manage_your/views/onboardscreens/onboarding_screens_main.dart';
import 'package:manage_your/views/onboardscreens/onboardscreen1.dart';
import 'package:manage_your/views/profiecreation/profilescreen1.dart';
import 'package:manage_your/views/settings/AboutUs/aboutus.dart';
import 'package:manage_your/views/settings/privacy_policy/privacy_policy.dart';
import 'package:manage_your/views/settings/settings.dart';
import 'package:manage_your/views/splashscreen/splashscreen.dart';
import 'package:manage_your/views/taskdetail/taskdetail.dart';
import 'package:manage_your/views/tasks/Addtaskview.dart';
import 'package:manage_your/views/tasks/updatetaskview.dart';
import 'package:provider/provider.dart';
//import 'package:manage_your/views/tasks/Addtask.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(TasksAdapter().typeId)){
    Hive.registerAdapter(TasksAdapter());
  }
  if(!Hive.isAdapterRegistered(CategoryAdapter().typeId)){
    Hive.registerAdapter(CategoryAdapter());
  }
  if(!Hive.isAdapterRegistered(UserpreferenceAdapter().typeId)){
    Hive.registerAdapter(UserpreferenceAdapter());
  }


  await Hive.openBox('userprefs_db');
   
  
  runApp(
    const MyApp()
    //  ChangeNotifierProvider(
    // create: (context) => ThemeProvider(),
    // child: const MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
       //darkTheme: Provider.of<ThemeProvider>(context).themeData,
     // theme: 
      debugShowCheckedModeBanner: false,
      home: 
      Homeview(),
     // SplashScreen()
      //OnboardingScreen1()
      //onboardingScreen2()
      //MainOnboarding(),
     //profileScreen1(),
     
     //privacypolicy(),
     //aboutUs()
     //Addtaskview(),
     //UpdateTaskView()
     //taskDetailview()
     //SettingsPage()
     //searchscreen()
      
       
    );
  }
}

 