import 'package:hive/hive.dart';

part 'userprefs.g.dart';

@HiveType(typeId: 2)
class Userpreference{

    

     @HiveField(0)
     final bool? isdarkMode;


     @HiveField(1)
     final bool? showonboarding;


     @HiveField(2)
     String? time;

  Userpreference({ this.isdarkMode, this.showonboarding , this.time}){
    print(time);
  }
}