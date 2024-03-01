import 'package:hive/hive.dart';

part 'userprefs.g.dart';

@HiveType(typeId: 2)
class Userpreference{

    

 


     @HiveField(0)
      bool? showonboarding;


     @HiveField(1)
     String? remindertime;

     @HiveField(2)
     String? username;

     @HiveField(3)
     bool? usernameadded;

  Userpreference({this.showonboarding , this.remindertime , this.username}){
    //print(remindertime);
  }
}