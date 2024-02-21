
import 'package:hive/hive.dart';
import 'package:manage_your/model/userprofile/userprofile.dart';

Future<void> addprofile(Userprofile value) async{
  
  final userProfileDb = await Hive.openBox<Userprofile>('userprofile_db');

  final userid = await userProfileDb.add(value);
  value.id = userid;

  print(value.toString());

}