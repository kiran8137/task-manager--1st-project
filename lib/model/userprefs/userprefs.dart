import 'package:hive/hive.dart';

part 'userprefs.g.dart';

@HiveType(typeId: 2)
class Userpreference{

    

 


     @HiveField(0)
      bool? showonboarding;


    //  @HiveField(1)
    //  String? reminderTime =  DateTime.now().subtract(Duration(minutes: 5)).toString();

    //  @HiveField(1)
    //  String? username;

    //  @HiveField(2)
    //  bool? usernameadded;

  Userpreference({this.showonboarding}){
     //reminderTime = DateTime.now().subtract(Duration(minutes: remindertime)).toString();
     
    //print(remindertime);
  }
}