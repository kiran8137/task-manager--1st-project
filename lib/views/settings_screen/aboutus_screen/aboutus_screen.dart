import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text("About Us",
        style:  TextStyle(color: Colors.white)
        ),
        centerTitle: true,
        backgroundColor:  Colors.black,


        leading:
         GestureDetector(

          //return back to settings page
          onTap: () => Navigator.pop(context),
          child:  const Icon(Icons.arrow_back,
          color: Colors.white),
        ),
      ),
        backgroundColor: Colors.black,




        body:    SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "This is an app that is developed as part of my project and this will be one of my freatest milstone in my career.This  is an Task manager application MANAGE YOU"
                "which is very useful to manage your day to day task  and a reminder to remind their events or tasks in future. ",
                style: TextStyle(color: Colors.white,
                fontSize:  MediaQuery.of(context).size.width * 0.048,//18
                )
                
                // TextStyle(
                  
                //   //color: Theme.of(context).textTheme.,
                //   fontSize: 18),
                 ),
          ),
        ));
  }
}
