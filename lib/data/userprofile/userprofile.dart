
import 'package:hive/hive.dart';
import 'package:manage_your/model/task.dart';
import 'package:manage_your/model/userprofile/userprofile.dart';

Future<void> addprofile(Userprofile value) async{
  
  final userprofile_db = await Hive.openBox<Userprofile>('userprofile_db');

  final userid = await userprofile_db.add(value);
  value.id = userid;

  print(value.toString());

}