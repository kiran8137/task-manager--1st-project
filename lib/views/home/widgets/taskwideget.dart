import 'package:flutter/material.dart';
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/views/tasks/updatetaskview.dart';

class Taskwidget extends StatelessWidget {
  const Taskwidget({
    super.key, this.tasktitle, this.taskdescription,    
    
  });

  final tasktitle;
  final taskdescription;
   
   

   
  

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 110,
      duration: const Duration(milliseconds: 600),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Appcolors.secondarycolor,
          borderRadius: BorderRadius.circular(10)),
      child:  ListTile(
        //task title

        title: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
                tasktitle,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),

            GestureDetector(
              onTap: () {
                //editing page
                //print("edit");
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdateTaskView()));
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
               taskdescription,
              style: TextStyle(
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
        
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                margin: const EdgeInsets.only(left: 0),
                child:  Row(
                  children: [
                        
                    //time 
                        
                    Text("Time",
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w500),
                    ),
                        
                    //date
                        
                    Text( "date",
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
