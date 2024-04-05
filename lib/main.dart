// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manage_your/Hive_model/category_database_model/category.dart';
import 'package:manage_your/Hive_model/task_database_model/task.dart';
 
 
 
import 'package:manage_your/Hive_model/event_databases_model/event.dart';
 
import 'package:manage_your/Hive_model/username_database_model/username.dart';
import 'package:manage_your/Hive_model/userprefs_database_model/userprefs.dart';
 
 
 
import 'package:manage_your/notification_service/awsmnotif.dart';
import 'package:manage_your/notification_service/notifi_service.dart';
 
import 'package:manage_your/theme/theme.dart';
import 'package:manage_your/theme/themeprovider.dart';
import 'package:manage_your/views/Events/event/event_detail_screen.dart';
import 'package:manage_your/views/Events/event/even_update_screen.dart';
import 'package:manage_your/views/home_screen/components/search_screen/search_screen.dart';
import 'package:manage_your/views/home_screen/home_screen_view.dart';
//import 'package:manage_your/views/taskdetail.dart';
import 'package:manage_your/views/onboard_screens/onboarding_screen_main.dart';
import 'package:manage_your/views/onboard_screens/onboard_screen_1.dart';
import 'package:manage_your/views/profile_create_screen/profile_screen.dart';
import 'package:manage_your/views/settings_screen/aboutus_screen/aboutus_screen.dart';
import 'package:manage_your/views/settings_screen/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:manage_your/views/settings_screen/settings.dart';
import 'package:manage_your/views/splashscreen/splashscreen.dart';
import 'package:manage_your/views/task/task_detail_screen.dart';
import 'package:manage_your/views/task/task_add_screen.dart';
import 'package:manage_your/views/task/task_update_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//import 'package:manage_your/views/tasks/Addtask.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNofication();
 // NotificationService().initNotification();
  await Hive.initFlutter();
 // Directory directory = await getApplicationDocumentsDirectory();


  if(!Hive.isAdapterRegistered(TasksAdapter().typeId)){
    Hive.registerAdapter(TasksAdapter());
  }
  if(!Hive.isAdapterRegistered(CategoryAdapter().typeId)){
    Hive.registerAdapter(CategoryAdapter());
  }
  if(!Hive.isAdapterRegistered(UserpreferenceAdapter().typeId)){
    Hive.registerAdapter(UserpreferenceAdapter());
  }
  if(!Hive.isAdapterRegistered(UsernameAdapter().typeId)){
    Hive.registerAdapter(UsernameAdapter());
  }
  if(!Hive.isAdapterRegistered(EventAdapter().typeId)){
    Hive.registerAdapter(EventAdapter());
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

  static GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return   const MaterialApp(
       //darkTheme: Provider.of<ThemeProvider>(context).themeData,
     // theme: 
      debugShowCheckedModeBanner: false,
      home: 
      //Homeview(),
      SplashScreen()
      //OnboardingScreen1()
      //onboardingScreen2()
      //MainOnboarding(),
     // ProfileScreen()
     
     //privacypolicy(),
     //aboutUs()
     //Addtaskview(),
     //UpdateTaskView()
     //taskDetailview()
     //SettingsPage()
     //searchscreen()
     // Updateeventview()
      // EventDetailView()
    );
  }
}

 