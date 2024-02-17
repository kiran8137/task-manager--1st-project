import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:manage_your/data/functions.dart';
import 'package:manage_your/model/task.dart';
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/views/taskdetail/taskdetail.dart';
import 'package:manage_your/views/tasks/updatetaskview.dart';

class Taskwidget extends StatefulWidget {
   Taskwidget({
    super.key, 
    this.tasktitle, 
    this.taskdescription,
    required this.date,
    this.time,
    required this.index
     

          
    
  })
  {
   // print(date.runtimeType);
  }

  final tasktitle;
  final taskdescription;
  //final DateTime? dateTime;
  final DateTime date;
  final DateTime? time;
  final int index;

  @override
  State<Taskwidget> createState() => _TaskwidgetState();
}

class _TaskwidgetState extends State<Taskwidget> {

String? foramtteddate;

// @override
// void initState() {
//     // TODO: implement initState
//     super.initState();
//     if(widget.date!=null){
//       DateFormat('dd/mm/yyyy').format(widget.date!);
//     }
//   }
 

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
        onTap: () {
           final _dbtask= Tasks(tasktitle: widget.tasktitle, taskdescription: widget.taskdescription, date: widget.date,  );
          Navigator.push(context, MaterialPageRoute(builder: (context)=> taskDetailview(task:_dbtask , index: widget.index,)));
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
                  
                   final _dbtask= Tasks(tasktitle: widget.tasktitle, taskdescription: widget.taskdescription, date: widget.date,  );
                   
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  UpdateTaskView( 
                     task: _dbtask,
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
                      
                   const Text("time" ,
                  style:  TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                  ),
                  ),
                      
                      const SizedBox(width: 10),
                  //date
                      
                    Text(DateFormat('dd-MM-yyyy').format(widget.date).toString(),
                  style: const TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w400,
                  
                  ),
                  ),
            
                  SizedBox(
                    //width: 215,
                    width: 150,
                    ),
            
                Checkbox(
                  value: ischecked, 
                  onChanged: (value){
                    // setState(() {
                    //   ischecked = !ischecked;
                    // });
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
