import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:manage_your/data/event/eventfucntions.dart';
import 'package:manage_your/Hive_model/event_databases_model/event.dart';
 
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/views/home_screen/home_screen_view.dart';

class EventDetailView extends StatefulWidget {
  const EventDetailView({
    super.key, 
    required this.event, 
    required this.index,
  });

 final Event event;
final int index;

  @override
  State<EventDetailView> createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  TextEditingController? eventnamecontroller;
  TextEditingController? eventlocationcontroller;

   

  String? recieveddate;
  DateTime? newPickedDate;

  String? recievedtime;
  TimeOfDay? newPickedTime;

  String? formattedTime;

  String? recievedimage;
  XFile? _newpickedimage;
  final picker = ImagePicker();

  @override
  void initState() {

    eventnamecontroller = TextEditingController(text: widget.event.eventname);
    eventlocationcontroller = TextEditingController(text: widget.event.eventlocation);
    recieveddate = DateFormat('dd-MM-yyyy').format(widget.event.date!);
    recievedtime = widget.event.time;
    recievedimage = widget.event.imagepath;

    super.initState();
  }

  getimage() async{
  final image = await  picker.pickImage(source: ImageSource.gallery);

  setState(() {
    _newpickedimage = image;
    if(_newpickedimage!=null){
      recievedimage = _newpickedimage!.path;
    }
    
  });
 }

 

  

  late bool iseditSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton(
            iconColor: Colors.white,
            // Icon(Icons.more_vert,color: Colors.white,)
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 0,
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text("Edit"),
                  ),
                ),
                const PopupMenuItem(
                  value: 1,
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text("Delete"),
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                setState(() {
                  iseditSelected = !iseditSelected;
                });
                //print("edit selected");
                //should navigate to the edit page
              } else if (value == 1) {
                // print("delete is selected");
                //should delete the task
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text("Alert....!"),
                          content:
                              const Text("Sure You Want to Delete This Task"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text("Cancel")),
                            TextButton(
                              onPressed: () {
                                  removeevent(widget.index);
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Homeview()));
                              },
                              child: const Text("Ok"),
                            ),
                          ],
                        ));
              }
            },
          )
        ],
        backgroundColor: Colors.black,
      ),
      floatingActionButton: Visibility(
        visible: iseditSelected,
        child: GestureDetector(
          onTap: () {
            updateEvent(
              eventnameController: eventnamecontroller,
              eventlocationController: eventlocationcontroller,
              date: newPickedDate ?? widget.event.date, 
              time: formattedTime ?? recievedtime,
              index: widget.index ,
              imagepath: _newpickedimage?.path ?? widget.event.imagepath
            
            );
            Navigator.of(context).pop();
            setState(() {
              iseditSelected = !iseditSelected;
            });
          },
          child: Container(
            //width: 600,
            width: MediaQuery.sizeOf(context).width * 50 / 100,
            height: MediaQuery.of(context).size.height * 0.05,//40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Appcolors.buttonColor,
            ),
            child:   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,//17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,//250,
                  width: double.infinity,
                 // color: Colors.red,


                  child:
                   
                   GestureDetector(
                    onTap: (){
                      if(iseditSelected){
                        getimage();
                      }
                     // getimage();
                    },
                    child: Image.file(File(recievedimage!),fit:BoxFit.cover),),),
                
               // Image.file(File(widget.event.imagepath!),fit:BoxFit.cover),),
                
                  SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,//5,
                ),
                const Divider(color: Color.fromARGB(153, 158, 158, 158)),
                  SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,//5,
                ),
                
                 AnimatedContainer(
                    //height: 110,
                    duration: const Duration(milliseconds: 600),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      //color:  Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    child: iseditSelected ?
                    TextFormField(
                      controller: eventnamecontroller,
                       style: const TextStyle(color: Colors.white),
                    ):
                    Text(
                   widget.event.eventname,
                  style:   TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,//25,
                     color: Colors.white),
                ),
                 ),
                 
                  SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,//30,
                ),
                GestureDetector(
                  onTap: () async {
                    // print("click worked well");

                    if (iseditSelected) {
                      newPickedDate = await showDatePicker(
                        
                        context: context,
                        initialDate: widget.event.date,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                    }
                    // NewPickedDate = await showDatePicker(

                    //   context: context,
                    //   initialDate: DateTime.now(),
                    //   firstDate: DateTime(2000),
                    //   lastDate: DateTime(2100),
                    //   );
                    // setState(() {
                    //   datecontroller.text = DateTime.now().toString();
                    // });
                    // DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)
                    if (newPickedDate != null) {
                      setState(() {
                        recieveddate =
                            DateFormat('dd/MM/yyyy').format(newPickedDate!);
                      });
                    }
                    // setState(() {
                    //   _datecontroller.text = DateTime.now().toString();
                    // });
                  },
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Date",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 247,
                      ),
                      Container(
                         height: MediaQuery.of(context).size.width * 0.06,//30,
                        width: MediaQuery.of(context).size.width * 0.24,//100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 48, 47, 47),
                          ),
                          child:  Center(
                              child: Text(
                            recieveddate!,
                            //DateFormat('dd-MM-yyyy').format(widget.task.date!),
                            style:   TextStyle(
                                color: Colors.white, 
                                fontSize: MediaQuery.of(context).size.width * 0.04,//16
                                ),
                          ))),
                    ],
                  ),
                ),
                const Divider(color: Color.fromARGB(53, 158, 158, 158)),
                  SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,//5
                  ),
                GestureDetector(
                  onTap: () async {
                    if (iseditSelected) {
                      final pickedtime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());

                      if (pickedtime != null) {
                        setState(() {
                          newPickedTime = pickedtime;
                        });

                        DateTime parsedTime = DateFormat.jm()
                            .parse(newPickedTime!.format(context).toString());
                        formattedTime =
                            DateFormat('h:mm a').format(parsedTime!);
                        recievedtime = formattedTime!;
                      } else {
                      //  print("user didn't update it");
                      }

                      //      newPickedTime= await showTimePicker(
                      //     context: context,
                      //      initialTime: TimeOfDay.now()
                      //      );
                      // //      if(pickedtime!=null){

                      // //   //  DateTime combinedDateTime = DateTime(
                      // //   //     pickeddate!.day,
                      // //   //     pickeddate!.month,
                      // //   //     pickeddate!.year,
                      // //   //     pickedtime!.minute,
                      // //   //     pickedtime!.hour,

                      // //   //   );

                      // //      // print(pickedtime!.format(context),
                      //       DateTime parsedTime = DateFormat.jm().parse(newPickedTime!.format(context).toString());

                      //        // print(parsedTime);

                      //         formattedTime = DateFormat('h:mm a').format(parsedTime!);
                      //        // print(formattedTime);

                      //       if(newPickedTime!=null){
                      //         setState(() {
                      //           recievedtime = formattedTime;
                      //         });
                      //       }
                      // setState(() {

                      //    recievedtime = formattedTime;
                      // });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text(
                        "Time",
                        style: TextStyle(color: Colors.white, 
                        fontSize: MediaQuery.of(context).size.width * 0.04,//16
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.06,//30,
                        width: MediaQuery.of(context).size.width * 0.2,//100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 48, 47, 47),
                        ),
                        child: Center(
                          child: Text(
                              recievedtime != null ? recievedtime! : 'No',
                              style:   TextStyle(
                                  color: Colors.white,
                                   fontSize: MediaQuery.of(context).size.width * 0.04,//16
                                   )
                                   ),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(color: Color.fromARGB(53, 158, 158, 158)),

                   SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,//5
                  ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                      "Location",
                      style: TextStyle(color: Colors.white,
                       fontSize: MediaQuery.of(context).size.width * 0.04,//16
                       ),
                    ),

                       
                       Text(
                         
                         
                         widget.event.eventlocation ,
                         
                           style:   TextStyle(
                               color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width * 0.04,//16
                                )
                                )
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
