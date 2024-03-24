
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manage_your/data/category/categoryfunctions.dart';
import 'package:manage_your/data/event/eventfucntions.dart';
import 'package:manage_your/data/task/taskfunctions.dart';
import 'package:manage_your/model/event/event.dart';
import 'package:manage_your/model/task/task.dart';
import 'package:manage_your/utils/apps_str.dart';

class Addeventview extends StatefulWidget {
 
  const Addeventview({super.key});

 
 
  @override
  State<Addeventview> createState() => _AddeventviewState();
}

class _AddeventviewState extends State<Addeventview> {

  final _formKey = GlobalKey<FormState>();



  final TextEditingController eventnamecontroller = TextEditingController();//controller for eventname
  final TextEditingController eventlocationcontroller = TextEditingController();//controller for description
  final TextEditingController eventdatecontroller = TextEditingController();//controller for date
  final TextEditingController eventtimecontroller = TextEditingController();//controller for time
   
  
  String eventname = ""; //Task name by the user
  String eventlocation = ""; //description by the user
  DateTime? eventdate;  
   
 
  
  TimeOfDay? pickedtime; 

  String? formattedTime;//time selected by the user and sending to the database
  
  DateTime? parsedTime; 
  
  DateTime defaulttime = DateTime.now();
  
  

   
  bool status = true;

   
 Future<void> onCreateevent()async{
  final eventname = eventnamecontroller.text.trim();
  final eventlocation = eventlocationcontroller.text.trim();

  if(eventname.isEmpty || eventlocation.isEmpty){
    return;
  }

  final event = Event(eventname: eventname, 
  eventlocation: eventlocation, 
  date: eventdate ?? DateTime.now(),
  time: formattedTime,
  );

  addevents(event);
 }

 





 

  @override
  Widget build(BuildContext   context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
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
                      'New Event',
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

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 185,
                     
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const  Text(
                    'Event Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                     Container(
                 // padding: const EdgeInsets.all(10),
                   // margin: EdgeInsets.only(left: 10, ),
                  width: 185,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      
                      style: const TextStyle(
                         
                      ),
                       controller: eventnamecontroller,
                      validator: (value) {
                         if (value == null || value.isEmpty) {
                          return 'please enter the event name';
                            }
                          return null;
                      },
                      
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Add the event name..."),
                    ),
                  ),
                ),
                      ],
                    ),
                  ),

                  Container(
                    height: 100,
                    width: 185,
                    
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                   'Event Location',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),

                  Container(
                 // padding: const EdgeInsets.all(10),
                   // margin: EdgeInsets.only(left: 10, ),
                  width: 185,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      
                      style: const TextStyle(
                         
                      ),
                       controller: eventlocationcontroller,
                      validator: (value) {
                         if (value == null || value.isEmpty) {
                          return 'please give the event location';
                            }
                          return null;
                      },
                      
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Add the event location"),
                    ),
                  ),
                ),
                      ],
                    ),
                  )
                ],
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
                    
                    
                    
                          // selecting the date
                    
                          child: const Text(
                            AppStrings.date,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                    
                        
                    
                        Container(
                         // padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 3),
                          width: MediaQuery.of(context).size.width * 40 / 100,
                          height: 43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            
                          ),
                    
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            controller: eventdatecontroller,
                            readOnly: true,
                            
                            decoration:  InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                              // icon: Icon(Icons.calendar_month,color: Color.fromARGB(111, 158, 158, 158),
                              // ),
                              prefixIcon:  const Icon(Icons.calendar_month,color: Color.fromARGB(111, 158, 158, 158)),
                    
                              border: InputBorder.none,
                              
                              hintText: DateFormat('dd-MM-yyyy').format(defaulttime) ,
                              //"dd/mm/yy",
                              hintStyle: const TextStyle(color: Color.fromARGB(111, 158, 158, 158),
                              
                            ),
                          ),
                          onTap: ()async{
                
                            eventdate = await showDatePicker(
                              
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(), 
                              lastDate: DateTime(2100),
                              );
                              // setState(() {
                              //   _datecontroller.text = DateTime.now().toString();
                              // });
                             // DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)
                              if(eventdate!=null){
                                setState(() {
                
                                  eventdatecontroller.text = DateFormat('dd/MM/yyyy').format(eventdate!);
                
                                });
                              }
                              // setState(() {
                              //   _datecontroller.text = DateTime.now().toString();
                              // });
                          },
                        ),
                        )
                      ]
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
                    
                    
                    
                          //selecting the time
                    
                          child: const Text(
                            AppStrings.time,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                    
                        
                    
                        Container(
                          //padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 0),
                          width: MediaQuery.of(context).size.width * 40 / 100,
                          height: 43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                    
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            controller: eventtimecontroller,
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
                            pickedtime = await showTimePicker(
                              context: context,
                               initialTime: TimeOfDay.now()
                               );
                               if(pickedtime!=null){
                
                            //  DateTime combinedDateTime = DateTime(
                            //     pickeddate!.day,
                            //     pickeddate!.month,
                            //     pickeddate!.year,
                            //     pickedtime!.minute,
                            //     pickedtime!.hour,
                                
                
                            //   );
                               
                               
                               // print(pickedtime!.format(context),
                                 parsedTime = DateFormat.jm().parse(pickedtime!.format(context).toString());
                                
                                //  print(parsedTime);
                    
                                   formattedTime = DateFormat('h:mm a').format(parsedTime!);
                                  //print(formattedTime);
                                setState(() {
                                  eventtimecontroller.text = formattedTime!;
                                });
                    
                                //pickeddate = DateFormat.jm().parse(pickedtime!.format(context).toString());
                                
                               }
                          },
                          
                          )
                        ),

                        
                      ],
                    ),
                ],
               ),

                Card(
                color: const Color.fromARGB(255, 220, 219, 219),
                child: SizedBox(
                  height: 230,

                  width: 350,
                  child: SizedBox(
                    width: 10,
                    height: 10,
                    child: Image.asset('assets/gallery.png',  )),
                ),
               ),

               Text("Tap to add an image",
               style: TextStyle(
                fontSize: 15,
                color: Colors.white
               ),
               ),

              SizedBox(height: 140,),

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
                          onCreateevent();
                          Navigator.pop(context);
                         // print("create");
                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Center(
                              child: const Text(
                              "Create",
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
      ),
    );
  }
}
