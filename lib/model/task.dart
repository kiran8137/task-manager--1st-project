import 'package:hive/hive.dart';

part 'task.g.dart';


@HiveType(typeId: 1)
class Tasks{

  @HiveField(0)
  final String tasktitle;

  @HiveField(1)
  final String taskdescription;

  @HiveField(2)
  final DateTime? date;

  


  Tasks({this.date,required this.tasktitle, required this.taskdescription});}