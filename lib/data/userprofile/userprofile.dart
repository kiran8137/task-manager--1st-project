// import 'package:hive/hive.dart';
// import 'package:manage_your/model/userprefs/userprefs.dart';

// Future<void> addpreference(Userpreference value) async{

//   final userprefs = await Hive.openBox<Userpreference>('userprofile_db');

//   await  userprefs.add(value);

//   print(value.toString());

//}

import 'package:hive_flutter/adapters.dart';
import 'package:manage_your/model/username_model/username.dart';

Future<void> addusername(Username name) async {
  final usernamedb = await Hive.openBox<Username>('username_db');
   
  //await usernamedb.add(name);
  await usernamedb.put(name.id, name);
}


Future<void> deleteuserdetails() async {
  final usernamedb = await Hive.openBox<Username>('username_db');
  await usernamedb.clear();
  
 }
