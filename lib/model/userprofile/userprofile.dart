import 'package:hive_flutter/adapters.dart';

part 'userprofile.g.dart';

@HiveType(typeId: 4)
class Userprofile{

@HiveField(0)
 int? id;

@HiveField(1)
final String? name;

  Userprofile({this.id, required this.name}){
    print(name);
  }



}