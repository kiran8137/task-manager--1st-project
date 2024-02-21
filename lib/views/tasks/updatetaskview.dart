 import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  late TextEditingController datecontroller ;
  late  TextEditingController timecontroller ;



  DateTime? newPickedDate;
  TimeOfDay? newPickedTime;


  String? formattedTime;

  @override
   void initState() {
    titleController = TextEditingController(text: widget.task.tasktitle);
    descriptionController = TextEditingController(text: widget.task.taskdescription);
    dropdownvalue = widget.task.category;
   datecontroller = TextEditingController(text: DateFormat('dd-MM-yyyy').format(widget.task.date!) );
   timecontroller = TextEditingController(text : widget.task.time);
    
   
   print(".....${widget.task.time}");

     
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
        child: SingleChildScrollView(
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
                height: 70,
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
                        child : TextFormField(
                          
                            textAlign: TextAlign.start,
                            controller: datecontroller,
                            readOnly: true,
                            
                            decoration:  const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                              // icon: Icon(Icons.calendar_month,color: Color.fromARGB(111, 158, 158, 158),
                              // ),
                              prefixIcon:  Icon(Icons.calendar_month,color: Color.fromARGB(111, 158, 158, 158)),
          
                              border: InputBorder.none,
                              
                              
                             // hintText: DateFormat('dd-MM-yyyy').format(defaulttime) ,
                              //"dd/mm/yy",
                              hintStyle: TextStyle(color: Color.fromARGB(111, 158, 158, 158),
                              
                            ),
                          ),
                          onTap: ()async{
          
                            newPickedDate = await showDatePicker(
                              
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000), 
                              lastDate: DateTime(2100),
                              );
                              // setState(() {
                              //   datecontroller.text = DateTime.now().toString();
                              // });
                             // DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)
                              if(newPickedDate!=null){
                                setState(() {
          
                                  datecontroller.text = DateFormat('dd/MM/yyyy').format(newPickedDate!);
          
                                });
                              }
                              // setState(() {
                              //   _datecontroller.text = DateTime.now().toString();
                              // });
                          },
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
                        //padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(left: 0),
                        width: MediaQuery.of(context).size.width * 40 / 100,
                        height: 43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
          
                        child: TextFormField(
                            textAlign: TextAlign.start,
                            controller: timecontroller,
                            readOnly: true,
                            
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                              // icon: Icon(Icons.calendar_month,color: Color.fromARGB(111, 158, 158, 158),
                              // ),
                              prefixIcon:  Icon(Icons.access_time_outlined,color: Color.fromARGB(111, 158, 158, 158)),
          
                              border: InputBorder.none,
                              hintText: "hh:mm",
                              hintStyle: TextStyle(color: Color.fromARGB(111, 158, 158, 158),
                              
                            ),
                          ),
                          onTap: ()async{
                             newPickedTime = await showTimePicker(
                              context: context,
                               initialTime: TimeOfDay.now()
                               );
                          //      if(pickedtime!=null){
          
                          //   //  DateTime combinedDateTime = DateTime(
                          //   //     pickeddate!.day,
                          //   //     pickeddate!.month,
                          //   //     pickeddate!.year,
                          //   //     pickedtime!.minute,
                          //   //     pickedtime!.hour,
                                
          
                          //   //   );
                               
                               
                          //      // print(pickedtime!.format(context),
                                DateTime parsedTime = DateFormat.jm().parse(newPickedTime!.format(context).toString());
                                
                                 // print(parsedTime);
          
                                  formattedTime = DateFormat('h:mm a').format(parsedTime!);
                                  print(formattedTime);
                                setState(() {
                                  timecontroller.text = formattedTime!;
                                }
                                );
          
                                //pickeddate = DateFormat.jm().parse(pickedtime!.format(context).toString());
                                
                               }
                           
                          
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
                      value:  dropdownvalue,
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
                        updateTask(titleController: titleController , descriptionController: descriptionController , index: widget.index , category: dropdownvalue , date: newPickedDate ?? widget.task.date , time: formattedTime ?? widget.task.time);
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
      ),
    );
  }
}
