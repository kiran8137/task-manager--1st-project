import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Tasks {

   
   
   
  @HiveField(0)
  String tasktitle;

  @HiveField(1)
  String taskdescription;

   @HiveField(2)
   //DateTime? datetime;
   DateTime? date;

   @HiveField(3)
   String? category;

   @HiveField(4)
   //TimeOfDay? time;
   String? time;
   
   @HiveField(5)
   String? reminderTime;

    
   

  Tasks( 
      {
       
      required this.tasktitle,
      required this.taskdescription,
      required this.date,
      this.category,
      this.time,
      this.reminderTime, 
      
      }){
      
       
      print("......tasktitle:$tasktitle taskdes:$taskdescription date:$date  category:$category  remindertime$reminderTime");
      }
}
