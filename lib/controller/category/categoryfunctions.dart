

import 'package:hive/hive.dart';
import 'package:manage_your/Hive_model/category_database_model/category.dart';
 


//categorylist show in the home page
var categoryitems = [  'work', 'personal', 'wishlist', 'birthday'];

//catergory list
List<String> items = [ 'work', 'personal', 'wishlist', 'birthday','CREATE NEW'];
//ValueNotifier<List<String>> itemsnotifier = ValueNotifier(['No Category', 'Work', 'personal', 'Wishlist', 'Birthday','CREATE NEW']);


Future<void> addCategory(Category category)async{

  final categorydb = await Hive.openBox<Category>('category_db');
 // await categorydb.add(category);
 await  categorydb.put('name', category);

  // final categoryid = await categorydb.add(category);
  // category.id = categoryid;

//print(categorydb.keys);

}

Future<void> categoryCreate(String? catergoryName) async{
//final categroybox = await Hive.openBox<Category>('category_db');
 var newCategory = Category(name: catergoryName);
    addCategory(newCategory);
  } 

  
  // var existingCategory = categroybox.values.where((element) =>
  // element.name == catergoryName,
  // ).toList();

  // if(existingCategory.isEmpty){
  //   var newCategory = Category(name: catergoryName);
  //   addCategory(newCategory);
  // } 


 
