 import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:manage_your/data/functions.dart';
import 'package:manage_your/model/task.dart';
import 'package:manage_your/utils/apps_str.dart';

class UpdateTaskView extends StatefulWidget {
  const UpdateTaskView({super.key, required this.task , required this.index});

final Tasks task;
final int index;
  

  

  @override
  State<UpdateTaskView> createState() => _UpdateTaskViewState();
}

class _UpdateTaskViewState extends State<UpdateTaskView> {

  late TextEditingController titleController ;
  late TextEditingController descriptionController;

  @override
   void initState() {
    titleController = TextEditingController(text: widget.task.tasktitle);
    descriptionController = TextEditingController(text: widget.task.taskdescription);
    dropdownvalue = widget.task.category;
    // TODO: implement initState
    super.initState();
  }

  String? dropdownvalue = "No Category";
  bool status = true;

  final timings = [
  '5 minutes before',
  '10 minutes before',
  '15 minutes before',
  '30 minutes before',
  '1 day before',
  '2 days before'
];
String subtitle = "5 minutes before ";


  var items = ['No Category', 'Work', 'personal', 'Wishlist', 'Birthday'];


   



  // void updateTask() {
  //   final TasksDB =Hive.box<Tasks>('task_db');
  //    Tasks newTask = Tasks(tasktitle: titleController.text, taskdescription: descriptionController.text, date: null);
  //    TasksDB.putAt(widget.index, newTask);
  //   // widget.task.tasktitle = titleController.text;
  //   // widget.task.taskdescription = descriptionController.text;
     
  //   // Save the updated task to the Hive database
  //   // final box = Hive.box<Tasks>('tasks');
  //   // box.put(widget.task.id, widget.task);

     
  // }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 9, 8, 79),
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(20),topRight: Radius.circular(20)
          // )
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              width: MediaQuery.sizeOf(context).width * 80 / 100,
              height: 50,
              //color: Colors.red,
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white))),
              child: const Center(
                child: Text(
                  AppStrings.updatetask,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 50,
            ),
            Container(
              ///
              margin: const EdgeInsets.only(left: 0, right: 280),
              child: const Text(
                AppStrings.tasktitle,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              //  margin: EdgeInsets.only(left: 10, ),
              width: MediaQuery.of(context).size.width - 40,
              height: 43,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, 
                      //hintText: "Add Task Name..."
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              //////
              margin: const EdgeInsets.only(left: 0, right: 260),
              child: const Text(
                
                AppStrings.descriptioninput,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              //margin: EdgeInsets.only(left: 0,right: 75),
              width: MediaQuery.of(context).size.width - 40,
              height: 68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    // hintText: 'Add description...'
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("data"),
                    Container(
                      //////
                      margin: const EdgeInsets.only(
                        left: 3,
                      ),
                      width: MediaQuery.of(context).size.width * 30 / 100,

                      // color: Colors.red,
                      child: const Text(
                        AppStrings.date,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    ),

                    const SizedBox(
                      height: 7,
                    ),

                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(left: 3),
                      width: MediaQuery.of(context).size.width * 40 / 100,
                      height: 43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("data"),
                    Container(
                      //////
                      margin: const EdgeInsets.only(
                        left: 0,
                      ),
                      width: MediaQuery.of(context).size.width * 30 / 100,

                      // color: Colors.red,
                      child: const Text(
                        AppStrings.time,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    ),

                    const SizedBox(
                      height: 7,
                    ),

                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(left: 0),
                      width: MediaQuery.of(context).size.width * 40 / 100,
                      height: 43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 24,
                ),
                DropdownButton(
                    dropdownColor: const Color.fromARGB(255, 9, 8, 79),
                    value: dropdownvalue,
                    items: items.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    }),
              ],
            ),
            // const SizedBox(
            //   height: 15,
            // ),


            const SizedBox(
              width: 24,
            ),

            
            GestureDetector(
              onTap: () {
                //print("reminder");
              },
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: timings[0],
                    child: Text(timings[0]),
                  ),
                  PopupMenuItem(
                    value: timings[1],
                    child: Text(timings[1]),
                  ),
                  PopupMenuItem(
                    value: timings[2],
                    child: Text(timings[2]),
                  ),
                  PopupMenuItem(
                    value: timings[3],
                    child: Text(timings[3]),
                  ),
                  PopupMenuItem(
                    value: timings[4],
                    child: Text(timings[4]),
                  ),
                  PopupMenuItem(
                    value: timings[5],
                    child: Text(timings[5]),
                  ),
                ],
                onSelected: (String newvalue) {
                  setState(() {
                    subtitle = newvalue;
                  });
                },
                child: ListTile(
              leading: const Icon(Icons.edit_notifications_outlined,color: Colors.white,size: 30,),
              title:  const Text("Reminder At",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17
                  ),
                  ),
                  subtitle:Text(subtitle,
                  style: const TextStyle(color: Colors.white),)
                  ),
              //   child: Text("Reminder At",
              //       style: TextStyle(color: Colors.white, fontSize: 18)),
               ),
            ),
            const SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      //print("cancel");
                      Navigator.pop(context);
                       
                    },
                    child: Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 9, 8, 79),
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                     // print("create");
                      updateTask(titleController: titleController , descriptionController: descriptionController , index: widget.index , category: dropdownvalue);
                     Navigator.pop(context);
                     
                    },
                    child: Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
