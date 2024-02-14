import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Tasks {

   
   
   
  @HiveField(0)
  String tasktitle;

  @HiveField(1)
  String taskdescription;

   @HiveField(2)
   DateTime? datetime;

  Tasks( 
      {
       
      required this.tasktitle,
      required this.taskdescription,
      required this.datetime,
      
      }){
      print(datetime);
      }
}
