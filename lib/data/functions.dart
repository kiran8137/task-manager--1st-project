import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manage_your/model/task.dart';

ValueNotifier<List<Tasks>> tasklistNotifier = ValueNotifier([]);

//Adding task to the database
Future<void> addtask(Tasks value) async{
  
  final TasksDB = await Hive.openBox<Tasks>('task_db');
//TasksDB.keys
  TasksDB.add(value);
  tasklistNotifier.value.add(value);
  
  //tasklistNotifier.value.add(value);
  tasklistNotifier.notifyListeners();
  //print(value.toString());
}


Future<void> getAllTasks()async{
  final TasksDB = await Hive.openBox<Tasks>('task_db');
  tasklistNotifier.value.clear();

  tasklistNotifier.value.addAll(TasksDB.values);
  tasklistNotifier.notifyListeners();
 
}