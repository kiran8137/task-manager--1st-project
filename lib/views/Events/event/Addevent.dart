import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manage_your/data/event/eventfucntions.dart';
import 'package:manage_your/model/event/event.dart';
import 'package:manage_your/utils/apps_str.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? _image;
  final picker = ImagePicker();
  
   
 
  
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
  imagepath: _image!.path,
  );

  addevents(event);
 }



 getimage() async{
  final image = await  picker.pickImage(source: ImageSource.gallery);

  setState(() {
    _image = image;
  });
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
                  height:  MediaQuery.of(context).size.height * 0.07,//50,
                  //color: Colors.red,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.white))),
                  child:   Center(
                    child: Text(
                      'New Event',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,//20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                  SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.05//50,
                ),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,//100,
                    width: MediaQuery.of(context).size.width * 0.45,//185,
                     
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                    'Event Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,//17,
                        fontWeight: FontWeight.w400),
                  ),
                     Container(
                 // padding: const EdgeInsets.all(10),
                   // margin: EdgeInsets.only(left: 10, ),
                  width: MediaQuery.of(context).size.width * 0.45,//185,
                  height: MediaQuery.of(context).size.height * 0.080,//70,
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

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,//100,
                    width: MediaQuery.of(context).size.width * 0.45,//185,
                    
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text(
                   'Event Location',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,//17,
                        fontWeight: FontWeight.w400),
                  ),

                  Container(
                 // padding: const EdgeInsets.all(10),
                   // margin: EdgeInsets.only(left: 10, ),
                  width: MediaQuery.of(context).size.width * 0.45,//185,
                  height: MediaQuery.of(context).size.height * 0.079,//70,
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
                    
                          child:   Text(
                            AppStrings.date,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width * 0.04,//17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                    
                        
                    
                        Container(
                         // padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 3),
                          width: MediaQuery.of(context).size.width * 40 / 100,
                          height: MediaQuery.of(context).size.height * 0.05,//43,
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
                    
                          child:   Text(
                            AppStrings.time,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:  MediaQuery.of(context).size.width * 0.04,//17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                    
                        
                    
                        Container(
                          //padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 0),
                          width: MediaQuery.of(context).size.width * 40 / 100,
                          height: MediaQuery.of(context).size.height * 0.05,//43,
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



                GestureDetector(
                  onTap: (){
                    getimage();
                  },
                  child: Card(
                  color: const Color.fromARGB(255, 220, 219, 219),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,//230,
                  
                    width: 350,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,//10,
                      height: MediaQuery.of(context).size.height * 0.02,//10,
                      child: 
                      _image==null ?
                       Image.asset('assets/gallery.png'):
                       Image.file(File(_image!.path,),fit:BoxFit.cover,
                       ),
                     ),
                  ),
                                 ),
                ),

                 Text("Tap to add an image",
               style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035,//15,
                color: Colors.white
               ),
               ),

                SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,//140,
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
                           height: MediaQuery.of(context).size.width * 0.1,//40,
                          width:  MediaQuery.of(context).size.width * 0.32,//130
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
                          if(_formKey.currentState!.validate()){
                            if(_image!=null){
                              onCreateevent();
                               Navigator.pop(context);
                            }else{
                               const snack = SnackBar(
                                      content: Text("Image not selected",
                                      style: TextStyle(color: Colors.black),),
                                      backgroundColor: Colors.white,
                                      elevation: 10,
                                      behavior: SnackBarBehavior.floating,
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(snack);
                            }
                          }
                          
                         // Navigator.pop(context);
                         // print("create");
                        },
                        child: Container(
                           height: MediaQuery.of(context).size.width * 0.1,//40,
                          width:  MediaQuery.of(context).size.width * 0.32,//130
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  const Center(
                              child: Text(
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
