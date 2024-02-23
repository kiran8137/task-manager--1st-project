 import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'category.g.dart';
@HiveType(typeId: 3)
 class Category{


  @HiveField(0)
  String? name;

  @HiveField(1)
  String? id;

Category({required this.name}){
  id = const Uuid().v4();
  print("id : $id : name: $name");
}
  
 }