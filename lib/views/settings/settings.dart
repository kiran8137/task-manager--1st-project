import 'package:flutter/material.dart';
import 'package:manage_your/theme/themeprovider.dart';
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/views/settings/AboutUs/aboutus.dart';
import 'package:manage_your/views/settings/privacy_policy/privacy_policy.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

final timings = [
  '5 minutes before',
  '10 minutes before',
  '15 minutes before',
  '30 minutes before',
  '1 day before',
  '2 days before'
];
String subtitle = "5 minutes before ";



//method to save theme preference 


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,

        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          //  print("settings go back");
          },
          child:  Icon(
            Icons.arrow_back,
            color:  Theme.of(context).iconTheme.color),
            ),

            title:  Text("Settings",style: Theme.of(context).textTheme.headlineMedium
            // TextStyle(
            //   color: Theme.of(context).textTheme.bodyLarge
            // ),
            ),
            
      ),

      

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: ()=>
            showDialog(context: context, 
            builder: (context)=>
            
            AlertDialog(
              
               content: GestureDetector(
                onTap: (){
                  Provider.of<ThemeProvider>(context , listen: false).toggleTheme();
                  
                },
                 child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                      ) ,
                      height: 60,
                      width: 90,
                      child:  Center(
                        child:
                       Text("Day",
                      style:  TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      )
                      ),
                      ),
                     
                       
                    ),
               ),
            )
            // Container(
            //   // height: 100,
            //   // width: 200,
            //   color: Colors.red,
            // )
            ),
            child: Container(
              
              margin: const EdgeInsets.only(top: 20,left: 10),
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20), 
                color:Appcolors.secondarycolor),
              child: const Center(child: Text("Theme",
              style: TextStyle(fontSize: 17,color: Colors.black))),
            ),
          ),
      
          const SizedBox(height: 20,),
      
      
          //privacy and policy
      
           GestureDetector(
            onTap: () {
      
              Navigator.push(context,MaterialPageRoute(builder: (context)=> const PrivacyPolicy()));
              //print("privacy and policy");
            },
             child:  ListTile(
              leading: Icon(Icons.privacy_tip_outlined,
              color: Theme.of(context).iconTheme.color,
              size: 29,),
              title: Text("Privacy and Policy",
                  style: Theme.of(context).textTheme.bodyLarge,
                  // TextStyle(
                  //   color: Colors.white,
                  //   fontSize: 17
                  // ),
                  )
              ),
             
           ),
      
           const SizedBox(height: 10,),
      
      
          //about us
            GestureDetector(
            onTap: () {
      
              Navigator.push(context,MaterialPageRoute(builder: (context)=> const AboutUs()));
              ///print("About Us");
            },
             child:  ListTile(
              leading: Icon(Icons.info_outline,
              color: Theme.of(context).iconTheme.color,
              size: 29,),
              title: Text("About Us",
                  style: Theme.of(context).textTheme.bodyLarge,
                  // TextStyle(
                  //   color: Colors.white,
                  //   fontSize: 17
                  // ),
                  ),
            
            
            
             )
            //   Container(
            //   margin: const EdgeInsets.only(left: 10),
            //   height: 50,
            //   width: 170,
            //   child: const Row(
            //     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Icon(Icons.info_outline,color: Colors.white,size: 30,),
            //       SizedBox(width: 5),
           
            //       Text("About Us",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 17
            //       ),
            //       ),
            //     ]
            //     ),
            //  ),
           ),
      
           const SizedBox(height: 10,),
      
           GestureDetector(
            onTap: () {
      
             
            //  print("default time");
            },
             child:PopupMenuButton(
             // initialValue: subtitle,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: timings[0],
                  child: Text(timings[0],
                   
                  ),
                  ),
      
                   PopupMenuItem(
                  value: timings[1],
                  child: Text(timings[1]),
                  ),
      
                   PopupMenuItem(
                  value: timings[2],
                  child: Text(timings[2]),
                  ),
      
                   PopupMenuItem(
                  value: timings[3],
                  child: Text(timings[3]),
                  ),
      
                   PopupMenuItem(
                  value: timings[4],
                  child: Text(timings[4]),
                  ),
      
                   PopupMenuItem(
                  value: timings[5],
                  child: Text(timings[5]),
                  ), 
              ],
      
              onSelected: (String newvalue) {
                setState(() {
                  subtitle = newvalue;
                });
              },
               child:  ListTile(
                leading:  Icon(Icons.edit_notifications_outlined,
                color: Theme.of(context).iconTheme.color,
                size: 29,
                ),
                title:   Text("Task reminder default",
                    style: Theme.of(context).textTheme.bodyLarge
                    //  TextStyle(
                    //   color: Colors.white,
                    //   fontSize: 17
                    // ),
                    ),
                    subtitle:Text(subtitle,
                    style: Theme.of(context).textTheme.bodyLarge
                    // const TextStyle(
                    //   color: Colors.white)
                    //   ,)
                    // ),
               ),
             )
            // Container(
            //   margin: const EdgeInsets.only(left: 10),
            //   height: 50,
            //   width: 200,
            //   child: const Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Icon(Icons.edit_notifications_outlined,color: Colors.white,size: 30,),
           
            //       Text("Task reminder default",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 17
            //       ),
            //       ),
            //     ]
            //     ),
            //  ),
             ),
             ),
        ],
      ),
    );
  }
}