

 

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manage_your/model/event/event.dart';

ValueNotifier<List<Event>> eventlistNotifier = ValueNotifier([]);

Future<void>addevents(Event values) async{

  final _eventdb = await Hive.openBox<Event>('event_db');

 _eventdb.add(values);
 eventlistNotifier.value.add(values);

 //should notify listener
eventlistNotifier.notifyListeners();
}

Future<void> getallevents()async{
  final _eventdb = await Hive.openBox<Event>('event_db');
  eventlistNotifier.value.clear();
  eventlistNotifier.value.addAll(_eventdb.values);

  eventlistNotifier.notifyListeners();
}


void removeevent(index)async{
   final box = await Hive.openBox<Event>('event_db');
   await box.deleteAt(index);
  eventlistNotifier.value = box.values.toList();
 }


 Future<void> updateEvent({TextEditingController? eventnameController , TextEditingController? eventlocationController , int? index ,   DateTime? date , String? time}) async {
 
    final tasksDB =Hive.box<Event>('event_db');
     Event newTask = Event(eventname: eventnameController!.text, eventlocation: eventlocationController!.text, date: date  , time: time);
     await tasksDB.putAt(index!, newTask);
     getallevents();

 }