import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:manage_your/alert_dialogs/no_task.dart';
import 'package:manage_your/data/category/categoryfunctions.dart';
import 'package:manage_your/data/event/eventfucntions.dart';
import 'package:manage_your/data/task/taskfunctions.dart';
import 'package:manage_your/data/userprofile/userprofile.dart';
import 'package:manage_your/model/event/event.dart';
import 'package:manage_your/model/task/task.dart';
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/views/Events/event/Addevent.dart';
import 'package:manage_your/views/Events/event/widget/eventwidget.dart';
import 'package:manage_your/views/home/components/appbar.dart';
import 'package:manage_your/views/home/widgets/taskwideget.dart';
import 'package:manage_your/views/onboardscreens/onboarding_screens_main.dart';
import 'package:manage_your/views/settings/settings.dart';
import 'package:manage_your/views/tasks/Addtaskview.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key, this.username});

  final String? username;

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
 

  final GlobalKey<ScaffoldState> _key = GlobalKey();
//TextEditingController searchController = TextEditingController();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  List<String> selectedCategory = [];
  List<Tasks> selectedtask = [];

// method to remove task from the list
//  void _remove(index)async{
//    final box = await Hive.openBox<Tasks>('task_db');
//    box.deleteAt(index);
//   tasklistNotifier.value = box.values.toList();
//  }

  bool isSearchvisible = false;

//  void togglesearch(isSearchvisible){
//   setState(() {
//     _isSearchvisible = isSearchvisible;
//   });
//  }

   

  @override
  Widget build(BuildContext context) {
    getAllTasks();
    getallevents();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        //Theme.of(context).colorScheme.primary,
      
        //floating Action button
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
                  print(items);
                  // displaybottomsheet(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Addtaskview()));
                  // print("fab tapped");
      
                  //Navigator.pop(context, MaterialPageRoute(builder: (context)=> const addtask()));
                },
                child: SpeedDial(
                  backgroundColor: Colors.blue,
                  
                  overlayOpacity: 0.3,
                  children: [
                    SpeedDialChild(
                       child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/createtasklogo.png',fit:BoxFit.cover,color: Colors.black,),
                        ),
                        label: 'Add Task' ,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Addtaskview()));
                        }
                    ),
                    SpeedDialChild(
                       child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/events.png',fit:BoxFit.cover),
                        ),
                        label: 'Add Event' ,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Addeventview()));
                        }
                    )
                  ],
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(
                      //     height: 30,
                      //     width: 30,
                      //     child: Image.asset(
                      //       "assets/createtasklogo.png",
                      //       fit: BoxFit.contain,
                      //     ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
        key: _key,
      
        appBar: appbar(
          _key,
          context,
          
        ),
        
      
      
        //side menu
      
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 43, 118, 204),
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              DrawerHeader(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.only(left: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon(Icons.close),
      
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Hello , Mr ${widget.username}",
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
      
                      const SizedBox(
                        height: 10,
                      ),
      
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: const Color.fromARGB(145, 57, 91, 155),
                                width: 5)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset(
                              'assets/user.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homeview()));
                  },
                  child: SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset(
                        "assets/home.png",
                        color: Colors.white,
                      )),
                ),
                title: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homeview()));
                    },
                    child: const Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homeview()));
                  },
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      "assets/setting.png",
                      color: Colors.white,
                    ),
                  ),
                ),
                title: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()));
                    },
                    child: const Text(
                      "Settings",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
      
              ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homeview()));
                  },
                  child: const SizedBox(
                    height: 25,
                    width: 25,
                    child:  Icon(Icons.logout,color: Colors.white,),
                  ),
                ),
                title: GestureDetector(
                    onTap: () {
                      deleteuserdetails();
                      
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>const  MainOnboarding(),
                              
                              ),
                              (route) => false);
                    },
                    child: const Text(
                      "logout",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
      
              
      
            ],
          ),
        ),
      
        //body
      
        body: _buildhomebody(),
      ),
    );
  }

  //homebody
  Widget _buildhomebody() {
    return TabBarView(
      children: [
        SingleChildScrollView(
        child: Column(
          children: [
            // const Divider(
            //   // Theme.of(context).colorScheme.secondary,
            //   thickness: 0.8,
            // ),
            const SizedBox(height: 5,),
      
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      print("delete every task");
      
                      tasklistNotifier.value.isEmpty?
                      noTaskWarning(context):
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text("Alert....!"),
                                content: const Text(
                                    "Sure you want to delete all the Task"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: const Text("Cancel")),
                                  TextButton(
                                    onPressed: () {
                                      deletealltask();
                                      Navigator.of(ctx).pop();
                                    },
                                    child: const Text("Ok"),
                                  ),
                                ],
                              ));
                    },
                    child: const Icon(
                      CupertinoIcons.delete,
                      color: Colors.white,
                      size: 30,
                    )),
      
      
      
                Container(
                  height: 50,
                  width: 380,
                  padding: const EdgeInsets.all(8),
                  child: categoryfilter(),
                ),
      
                
              ],
            ),
      
            const SizedBox(
              height: 6,
            ),
      
            const SizedBox(
              height: 6,
            ),
      
            //searchbar
      
            //searchOptionbar(isSearchvisible, searchController),
      
            //Tasks
      
            //  SizedBox(
            //       width: double.infinity,
            //       height: 600,
            //       child: AnimationLimiter(
            //         child: ListView.builder(
            //             itemCount: selectedtask.length,
            //             itemBuilder: (context, index) {
            //               final tasks = selectedtask[index];
            //               return AnimationConfiguration.staggeredList(
            //                 position: index,
            //                 duration: const Duration(milliseconds: 1000),
            //                 child: SlideAnimation(
            //                   child: FadeInAnimation(
            //                     child: Taskwidget(
            //                         tasktitle: tasks.tasktitle,
            //                         taskdescription: tasks.taskdescription,
            //                         date: tasks.date,
            //                         time: tasks.time,
            //                         category: tasks.category,
            //                         index: index),
            //                   ),
            //                 ),
            //               );
            //             }),
            //       ),
            //     ),
      
            SizedBox(
                width: double.infinity,
                height: 600,
                child: ValueListenableBuilder(
                  valueListenable: tasklistNotifier,
                  builder: (BuildContext context, List<Tasks> tasklist,
                      Widget? child) {
                          selectedtask = tasklist;
                        if(selectedCategory.isNotEmpty){
                          selectedtask = tasklist.where((task) => selectedCategory.contains(task.category)).toList();
                        }
                        
                    return selectedtask.isNotEmpty
                        ? AnimationLimiter(
                            child: ListView.builder(
                              itemCount: selectedtask.length,
                              itemBuilder: (context, index) {
                                final data = selectedtask[index];
                                // print(data.date);
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 1000),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: Slidable(
                                        // startActionPane: ActionPane(
                                        //   motion: const ScrollMotion(),
                                        //   extentRatio: 0.15,
                                        //   children: [
                                        //     SlidableAction(
                                        //       onPressed: (context) => {
      
                                                
                     
                                        //       },
                                        //       icon: CupertinoIcons.delete,
                                        //     )
                                        //   ],
                                        // ),
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(), 
                                          extentRatio: 0.15,
                                          children: [
                                             SlidableAction(
                                              onPressed: (context) => {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx) => AlertDialog(
                                                          title: const Text(
                                                              "Alert....!"),
                                                          content: const Text(
                                                              "Sure You Want to Delete This Task"),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          ctx)
                                                                      .pop();
                                                                },
                                                                child: const Text(
                                                                    "Cancel")),
                                                            TextButton(
                                                              onPressed: () {
                                                                removetask(index);
                                                                Navigator.of(ctx)
                                                                    .pop();
                                                              },
                                                              child: const Text(
                                                                  "Ok"),
                                                            ),
                                                          ],
                                                        ))
                                                //_remove(index)
                                              },
                                              icon: CupertinoIcons.delete,
                                            )
                                          ]),
                                        child: Taskwidget(
                                            tasktitle: data.tasktitle,
                                            taskdescription: data.taskdescription,
                                            date: data.date,
                                            time: data.time,
                                            category: data.category,
                                            index: index),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Stack(children: [
                            Positioned(
                              top: 110,
                              left: 95,
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Image.asset(
                                  "assets/task.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 275,
                                left: 120,
                                child: Text("Add Your Task ${widget.username}",
                                    style: GoogleFonts.italianno(
                                        textStyle: const TextStyle(
                                            color: Colors.white, fontSize: 25))
                                    // TextStyle(
                                    //   color: Colors.white,
                                    //   fontSize: 18,
                                    //   fontStyle: GoogleFonts.aBeeZee
                                    // ),
                                    ))
                          ]);
                  },
                )
                // :const Center(
                //   child: Text("NO TASK YET",style: TextStyle(color: Colors.white),),
                // )
                ),
          ],
        ),
      ),



      ValueListenableBuilder(
        valueListenable: eventlistNotifier, 
        builder:  (BuildContext context, List<Event> eventlist,
                      Widget? child){
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: AnimationLimiter(
                            child: ListView.builder(
                              itemCount: eventlist.length,
                              itemBuilder: ((context, index) {
                                final events = eventlist[index];
                                return AnimationConfiguration.staggeredList(
                                   position: index,
                                  duration: const Duration(milliseconds: 1000),
                                  child: SlideAnimation(
                                   // verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: Slidable(
                                        startActionPane: ActionPane(
                                          motion: const ScrollMotion(), 
                                          children: [
                                            SlidableAction(
                                              icon: CupertinoIcons.delete,
                                              onPressed: (onPressed){
                                                 showDialog(
                                                    context: context,
                                                    builder: (ctx) => AlertDialog(
                                                          title: const Text(
                                                              "Alert....!"),
                                                          content: const Text(
                                                              "Sure You Want to Delete This Task"),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(ctx).pop();
                                                                      
                                                                },
                                                                child: const Text(
                                                                    "Cancel")),
                                                            TextButton(
                                                              onPressed: () {
                                                                removeevent(index);
                                                                Navigator.of(ctx)
                                                                    .pop();
                                                              },
                                                              child: const Text(
                                                                  "Ok"),
                                                            ),
                                                          ],
                                                        ));
                                              })
                                          ]),
                                        child: Eventwidget(
                                          eventname: events.eventname,
                                          eventlocation: events.eventlocation,
                                          date: events.date,
                                          time: events.time,
                                          index: index,
                                          imagepath: events.imagepath,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),
                          ),
                        );
                      })
       
       
      ]
    );
  }

  SingleChildScrollView categoryfilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: categoryitems
              .map((category) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FilterChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor:
                            const Color.fromARGB(255, 224, 224, 224),
                        label: Text(category),
                        selected: selectedCategory.contains(category),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedCategory.add(category);
                              final taskdb = Hive.box<Tasks>('task_db');
                              selectedtask = taskdb.values.where((task) => 
                              task.category == category
                              ).toList();
                             

                            } else {
                              selectedCategory.remove(category);
                            }
                          },
                          );
                        },
                        ),
                        
                  ),
                  )
              .toList()),
    );
  }

 
}


