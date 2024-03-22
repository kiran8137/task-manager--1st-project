
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manage_your/model/task/task.dart';
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/views/taskdetail/taskdetail.dart';
import 'package:manage_your/views/tasks/updatetaskview.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class Eventwidget extends StatefulWidget {
   Eventwidget({super.key}
    
     

          
    
  )
  {
   // print(date.runtimeType);
  // print(date);
  }

   

  @override
  State<Eventwidget> createState() => _EventwidgetState();
}

class _EventwidgetState extends State<Eventwidget> {

 

 
   

String? foramtteddate;


 
bool ischecked = false;





  @override
  Widget build(BuildContext context) {
    
    //String foramtteddate = DateFormat('dd-mm-yyyy').format(widget.dateTime!);
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index){
         return Card(
          child: Container(
             height: 170,
            width: 200,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),

            child: Stack(
              children: [
                SizedBox(
                   
                   width: double.infinity,
                  child: Image.asset('assets/notask.png',fit: BoxFit.cover,  ),
                  ),

                  Opacity(
                    opacity: 0.9,
                    child: Container(
                      margin: EdgeInsets.only(top: 80),
                     height:  double.infinity,
                     width: double.infinity,
                     color: Colors.blue,

                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                  'Event Name',
                  style: TextStyle(fontSize: 23, color: Colors.black,fontWeight: FontWeight.bold),
                ),

                Row(
                  children: [
                     Text('date',style: TextStyle(fontSize: 17),),
                Text('time',style: TextStyle(fontSize: 17),),
                  ],
                ),

                Text('location',style: TextStyle(fontSize: 17),)
               
                      ],
                     ),
                     
                    ),
                  )
              ],
            ),

          )
           
          );
        }
      
         
      ),
    );
    
      
    
          
      
          
  }
}
