import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text("About Us",
        style:  Theme.of(context).textTheme.displaySmall,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,


        leading:
         GestureDetector(

          //return back to settings page
          onTap: () => Navigator.pop(context),
          child:  Icon(Icons.arrow_back,
          color: Theme.of(context).iconTheme.color),
        ),
      ),
        backgroundColor: Theme.of(context).colorScheme.background,




        body:  SizedBox(
          height: 800,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "This is an app that is developed as part of my project and this will be one of my freatest milstone in my career.This  is an Task manager application MANAGE YOU"
                "which is very useful to manage your day to day task  and a reminder to remind their events or tasks in future. ",
                style: Theme.of(context).textTheme.bodyLarge,
                
                // TextStyle(
                  
                //   //color: Theme.of(context).textTheme.,
                //   fontSize: 18),
                 ),
          ),
        ));
  }
}
