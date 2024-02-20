import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manage_your/model/task.dart';
import 'package:manage_your/model/userprefs/userprefs.dart';

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

Future<void> updateTask({TextEditingController? titleController , TextEditingController? descriptionController , int? index , String? category , DateTime? date , String? time}) async {
 
    final TasksDB =Hive.box<Tasks>('task_db');
     Tasks newTask = Tasks(tasktitle: titleController!.text, taskdescription: descriptionController!.text, date: date , category: category , time: time);
     await TasksDB.putAt(index!, newTask);
     getAllTasks();
      print("updated category $category");
    // widget.task.tasktitle = titleController.text;
    // widget.task.taskdescription = descriptionController.text;
     
    // Save the updated task to the Hive database
    // final box = Hive.box<Tasks>('tasks');
    // box.put(widget.task.id, widget.task);

     
  }


  void remove(index)async{
   final box = await Hive.openBox<Tasks>('task_db');
   box.deleteAt(index);
  tasklistNotifier.value = box.values.toList();
 }


 //
 Future<void> adddefaultime(String time)async{
   final userpfs = await Hive.openBox('userpfs_db');
   userpfs.add(time);
 }


