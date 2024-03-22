

 

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

}

Future<void> getallevents()async{
  final _eventdb = await Hive.openBox<Event>('event_db');
  eventlistNotifier.value.clear();
  eventlistNotifier.value.addAll(_eventdb.values);
}