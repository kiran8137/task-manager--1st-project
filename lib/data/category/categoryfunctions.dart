

import 'package:hive/hive.dart';
import 'package:manage_your/model/category_model/category.dart';

//categorylist show in the home page
var categoryitems = [  'Work', 'personal', 'Wishlist', 'Birthday','CREATE NEW'];

//catergory list
var items = ['No Category', 'Work', 'personal', 'Wishlist', 'Birthday','CREATE NEW']; 


Future<void> addCategory(Category category)async{

  final categorydb = await Hive.openBox<Category>('category_db');
  await categorydb.add(category);

  // final categoryid = await categorydb.add(category);
  // category.id = categoryid;

print(categorydb.keys);

}