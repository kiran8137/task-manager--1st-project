import 'package:hive/hive.dart';

 part 'event.g.dart';

@HiveType(typeId: 5)
class Event{

  @HiveField(0)
  String eventname;

  @HiveField(1)
  String eventlocation;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  String? time;

Event({
  required this.eventname,
  required this.eventlocation,
  required this.date,
  this.time
}){

  print("......eventname:$eventname eventlocation:$eventlocation date:$date   ");
}

  
}