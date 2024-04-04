
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manage_your/model/event/event.dart';
import 'package:manage_your/views/Events/event/eventdetail.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class Eventwidget extends StatefulWidget {
   const Eventwidget({super.key, 
   this.eventname, 
   this.eventlocation, 
   this.date, 
   this.time,
   required this.index,
   this.imagepath,

   }
    
     

          
    
  )
;
  final eventname;
  final eventlocation;
  final DateTime? date;
  final String? time;
   final int index;
   final String? imagepath;
  //final DateTime? dateTime;
  
   
 
   

   

  @override
  State<Eventwidget> createState() => _EventwidgetState();
}

class _EventwidgetState extends State<Eventwidget> {

 

 
   

String? foramtteddate;


 
bool ischecked = false;





  @override
  Widget build(BuildContext context) {
    
    //String foramtteddate = DateFormat('dd-mm-yyyy').format(widget.dateTime!);
    return  Card(
        child: GestureDetector(
          onTap: (){
            final  dbevent = Event(eventname: widget.eventname, eventlocation: widget.eventlocation, date: widget.date, time: widget.time , imagepath: widget.imagepath); 
            Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailView(event: dbevent, index: widget.index,)));
          },
          child: Container(
             height:  MediaQuery.of(context).size.height * 0.24,//170,
            width: double.infinity,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              
            ),
              
            child: Stack(
              children: [
                SizedBox(
                   
                   width: double.infinity,
                  child: widget.imagepath==null?
                  Image.asset('assets/notask.png',fit: BoxFit.cover,) :
                  Image.file(File(widget.imagepath!),fit:BoxFit.cover)
                  ),
              
                  Opacity(
                    opacity: 0.9,
                    child: Container(
                      margin: const EdgeInsets.only(top: 80),
                     height:  double.infinity,
                     width: double.infinity,
                     color: Colors.blue,
              
                     child: Padding(
                       padding: const EdgeInsets.all(4.5),
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           widget.eventname,
                           style:   TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06, //23,
                             color: Colors.black,fontWeight: FontWeight.bold),
                           ),
                           
                           Row(
                           children: [
                       Text(DateFormat("d MMM yyyy").format(widget.date ?? DateTime.now()),
                       style:   TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04, //17
                        ),),
                         SizedBox(
                        width:  MediaQuery.of(context).size.width * 0.02,//10
                        ),


                         Text(  widget.time!=null?widget.time!:'',
                                
                          style:   TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04, //17
                            ),),
                         ],
                         ),
                           
                         Text(widget.eventlocation,style:  
                          TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,//17
                          ),)
                                    
                        ],
                       ),
                     ),
                     
                    ),
                  )
              ],
            ),
              
          ),
        )
         
        );
    
       
    
    
      
    
          
      
          
  }
}
