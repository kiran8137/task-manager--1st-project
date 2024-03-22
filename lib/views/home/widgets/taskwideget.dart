import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manage_your/model/task/task.dart';
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/views/taskdetail/taskdetail.dart';
import 'package:manage_your/views/tasks/updatetaskview.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class Taskwidget extends StatefulWidget {
   Taskwidget({
    super.key, 
    this.tasktitle, 
    this.taskdescription,
    this.date,
    this.time,
    required this.index,
    required this.category,
     

          
    
  })
  {
   // print(date.runtimeType);
  // print(date);
  }

  final tasktitle;
  final taskdescription;
  //final DateTime? dateTime;
  final DateTime? date;
  final String? time;
  final int index;
  final String? category;

  @override
  State<Taskwidget> createState() => _TaskwidgetState();
}

class _TaskwidgetState extends State<Taskwidget> {

 

 
   

String? foramtteddate;


 
bool ischecked = false;





  @override
  Widget build(BuildContext context) {
    
    //String foramtteddate = DateFormat('dd-mm-yyyy').format(widget.dateTime!);
    return AnimatedContainer(
      height: 110,
      duration: const Duration(milliseconds: 600),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Appcolors.secondarycolor,
          borderRadius: BorderRadius.circular(10),
          ),
          
      child:  ListTile(
        onTap: () async{
          // NotificationService().showNotification(
          //   title: 'sample testing' , body: 'it works'
          // );
           final dbtask= Tasks(tasktitle: widget.tasktitle, taskdescription: widget.taskdescription, category: widget.category , date: widget.date, time: widget.time  );
          Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskDetailView(task:dbtask , index: widget.index,)));
        },
        //task title

        title: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
                widget.tasktitle,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),

            GestureDetector(
              onTap: () {
                //editing page
                //print("edit");
              },
              child: GestureDetector(
                onTap: () async {
                  
                   final dbtask= Tasks(tasktitle: widget.tasktitle, taskdescription: widget.taskdescription, category: widget.category ,date: widget.date , time: widget.time  );
                   
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  UpdateTaskView( 
                     task: dbtask,
                     index : widget.index
                  )));
                },
                child: const Text("Edit",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15
                ),),
              ),
            ),
          ],
        ),

        //task description

        subtitle:   Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
               widget.taskdescription,
              style: const TextStyle(
                  color: Color.fromARGB(167, 255, 255, 255),
                  fontWeight: FontWeight.w500),
            ),
        
            const Divider(
              color: Colors.white,
              thickness: 0.8,
              
               
            ),

            // Container(
            //   width: double.infinity,
            //   height: 5,
            //   color: Colors.white,
            // ),
            
        
            //date and time
        
            Container(
             // color: Colors.red,
              height: 30,
              width: 370,
              margin: const EdgeInsets.only(left: 0),
              child:  Row(
                children: [
                      
                  //time 
                      
                    Text(
                      DateFormat("d MMM yyyy").format(widget.date ?? DateTime.now()),
                      
                  style: const TextStyle(color: Colors.white,
                 // fontWeight: FontWeight.w400,
                 fontSize : 13,
                  
                  ),
                //       widget.time!=null?
                //       widget.time!:'',
                      
                      
                //   style:  const TextStyle(color: Colors.white,
                //  // fontWeight: FontWeight.w500,
                //   fontSize: 13
                //   ),
                  ),
                      
                      const SizedBox(width: 10),
                  //date
                      
                    Text(
                            widget.time!=null?
                      widget.time!:'',
                      
                      
                  style:  const TextStyle(color: Colors.white,
                 // fontWeight: FontWeight.w500,
                  fontSize: 13
                  ),
                //       DateFormat("dd-MM").format(widget.date ?? DateTime.now()),
                      
                //   style: const TextStyle(color: Colors.white,
                //  // fontWeight: FontWeight.w400,
                //  fontSize : 13,
                  
                //   ),
                  ),

                  widget.time!=null?
                   const SizedBox(
                    //width: 215,
                    
                    //width: 189,
                    width : 170
                    ):
                  const SizedBox(
                    //width: 215,
                    
                    width: 226,
                    //width : 226
                    ),
            
              // Checkbox(
              // value: ischecked, 
              // onChanged: (value){
              //   // setState(() {
              //   //   ischecked = !ischecked;
              //   // });
              // },
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              // )
               
                 
                ],
              ),
              
            )
          ],
        ),

        
      ),
      
    );
  }
}
