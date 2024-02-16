

import 'package:hive/hive.dart';
import 'package:manage_your/model/category_model/category.dart';

Future<void> addCategory(Category category)async{

  final categorydb = await Hive.openBox<Category>('category_db');

  final categoryid = await categorydb.add(category);
  category.id = categoryid;

print(categorydb.keys);

}