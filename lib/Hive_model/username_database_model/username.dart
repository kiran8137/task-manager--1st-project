

import 'package:hive/hive.dart';

 part 'username.g.dart';

@HiveType(typeId: 4)
class Username{

@HiveField(0)
String? name;


@HiveField(1)
bool? nameentered;

@HiveField(2)
final String id = '1';

Username({required this.name , this.nameentered}){
  //print(name);
  //print(nameentered);
}


}