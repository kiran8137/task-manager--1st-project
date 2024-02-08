import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manage_your/data/functions.dart';
import 'package:manage_your/model/task.dart';
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/views/taskdetail/taskdetail.dart';
import 'package:manage_your/views/tasks/updatetaskview.dart';

class Taskwidget extends StatefulWidget {
  const Taskwidget({
    super.key, 
    this.tasktitle, 
    this.taskdescription,
          
    
  });

  final tasktitle;
  final taskdescription;

  @override
  State<Taskwidget> createState() => _TaskwidgetState();
}

class _TaskwidgetState extends State<Taskwidget> {

   

bool ischecked = false;

  @override
  Widget build(BuildContext context) {
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=> taskDetailview()));
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
                  
                   final _dbtask= Tasks(tasktitle: widget.tasktitle, taskdescription: widget.taskdescription);
                   
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  UpdateTaskView( 
                     task: _dbtask,
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
                      
                   Text("time" ,
                  style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w500),
                  ),
                      
                  //date
                      
                    Text("date",
                  style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w400),
                  ),
            
                  SizedBox(
                    //width: 215,
                    width: MediaQuery.of(context).size.width*0.5,
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
