import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manage_your/Hive_model/event_databases_model/event.dart';

import 'package:manage_your/Hive_model/task_database_model/task.dart';
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/views/home_screen/widgets/task_tile_wideget.dart';
import 'package:manage_your/views/task/task_add_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key, this.tabindex});

  final int? tabindex;
  @override
  State<CalenderScreen> createState() => CalenderScreenState();
}

class CalenderScreenState extends State<CalenderScreen> {
  DateTime todaydate = DateTime.now();

  final taskdb = Hive.box<Tasks>('task_db');
  final eventdb = Hive.box<Event>('event_db');
  List<Tasks> selectedtask = [];
  List<Event> selectedevent = [];

  DateTime? startdate;
  DateTime? enddate;

  @override
  void initState() {
    _onDaySelectedtask(todaydate, todaydate);
    // _onDaySelectedevent(todaydate, todaydate);
    super.initState();
  }

  void _onDaySelectedtask(DateTime day, DateTime focusedDay) {
    setState(() {
      todaydate = day;
      selectedtask = taskdb.values
          .where((task) =>
              task.date?.year == todaydate.year &&
              task.date?.month == todaydate.month &&
              task.date?.day == todaydate.day)
          .toList();
    });
  }

  // void _onDaySelectedevent(DateTime day, DateTime focusedDay) {
  //   setState(() {
  //     todaydate = day;
  //     selectedevent = eventdb.values
  //         .where((event) =>
  //             event.date?.year == todaydate.year &&
  //             event.date?.month == todaydate.month &&
  //             event.date?.day == todaydate.day)
  //         .toList();
  //   });
  // }

  // void onRangeSelected(DateTime? start, DateTime? end ,DateTime? focusedDay){
  //   setState(() {
  //   //  todaydate = null;
  //     focusedDay = focusedDay;
  //     startdate = start;
  //     enddate = end;
  //     selectedtask = taskdb.values.where((task) => task.date!.isAfter(start!) &&
  //       task.date!.isBefore(end)
  //     ).toList();

  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AnimationConfiguration.staggeredGrid(
          position: 0,
          duration: const Duration(milliseconds: 1000),
          columnCount: 2,
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              duration: const Duration(milliseconds: 1000),
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () {
                  // displaybottomsheet(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Addtaskview()));
                  // print("fab tapped");

                  //Navigator.pop(context, MaterialPageRoute(builder: (context)=> const addtask()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 60 / 100,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Appcolors.buttonColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Add New Text",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            "assets/createtasklogo.png",
                            fit: BoxFit.contain,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
            //go back to setting page
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 395,
                  width: double.infinity,
                  child: TableCalendar(
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(day, todaydate),
                    focusedDay: todaydate,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    onDaySelected: _onDaySelectedtask,
                    //  widget.tabindex == 0 ?
                    //  _onDaySelectedtask :
                    //  _onDaySelectedevent,

                    rangeStartDay: startdate,
                    rangeEndDay: enddate,
                    // onRangeSelected: onRangeSelected,
                    rangeSelectionMode: RangeSelectionMode.toggledOn,
                    headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle(color: Colors.white),
                        rightChevronIcon:
                            Icon(Icons.chevron_right, color: Colors.white),
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        )),
                    calendarStyle: const CalendarStyle(
                      todayTextStyle: TextStyle(color: Colors.white),
                      defaultTextStyle: TextStyle(color: Colors.blue),
                      weekNumberTextStyle: TextStyle(color: Colors.red),
                      weekendTextStyle: TextStyle(color: Colors.pink),
                      outsideTextStyle: TextStyle(color: Colors.white),
                    ),
                    eventLoader: (day) {
                      final hastasks = Hive.box<Tasks>('task_db')
                          .values
                          .any((task) => isSameDay(task.date, day));
                      return hastasks ? [day] : [];
                    },
                  ),
                ),
              ),

              const SizedBox(height: 5),

              //widget.tabindex == 0?
              SizedBox(
                width: double.infinity,
                height: 600,
                child: AnimationLimiter(
                  child: ListView.builder(
                      itemCount: selectedtask.length,
                      itemBuilder: (context, index) {
                        final tasks = selectedtask[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 1000),
                          child: SlideAnimation(
                            child: FadeInAnimation(
                              child: Taskwidget(
                                  tasktitle: tasks.tasktitle,
                                  taskdescription: tasks.taskdescription,
                                  date: tasks.date,
                                  time: tasks.time,
                                  category: tasks.category,
                                  index: index),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
