 import 'package:hive/hive.dart';

part 'category.g.dart';
@HiveType(typeId: 3)
 class Category{


  @HiveField(0)
  String? name;

  @HiveField(1)
  int? id;

Category({required this.name, this.id});
  
 }