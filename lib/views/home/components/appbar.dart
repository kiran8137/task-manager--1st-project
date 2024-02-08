// import 'package:flutter/material.dart';

// class appbar extends StatelessWidget {
//   const appbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
       
//     );
       
//   }
// }


import 'package:flutter/material.dart';
import 'package:manage_your/utils/apps_str.dart';

PreferredSize appbar(GlobalKey<ScaffoldState>key){
  bool isSearchvVisible = false;
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
     child: Container(
    
      width: double.infinity,
      height: 100,
      color: Colors.black,
      child:  SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Text("data"),


            // Visibility(
            //   visible: isSearchvVisible,
            //   child: TextField(
            //     onChanged: (value){},
            //   )
            //   ),

            //menu
             GestureDetector(
              onTap: (){
                
                 key.currentState!.openDrawer();
               // print("menu");
              },
               child: SizedBox(
                    height: 18,
                    width: 18,
                    child: Image.asset("assets/menu.png",
                    color: Colors.white,),
                   ),
             ),


            //Home
              GestureDetector(
                onTap: () {
                  //todo navigation to home
                  //print("home");
                },
                child:  SizedBox(
                  height: 18,
                  width: 18,
                  child: Image.asset("assets/home.png",
                  color: Colors.white,),
                )
              ),


              const Text(
                AppStrings.appName,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),


              //search
               GestureDetector(
                onTap: () {

                  isSearchvVisible = !isSearchvVisible;
                  //todo search
                  //print("search");
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
               
              

              //calender

                GestureDetector(
                onTap: () {
                  //todo navigation to calender
                  //print(" calendar");
                },
                child: const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
              ),
              

          
          ],
        ),
      ),
      
     ));
}