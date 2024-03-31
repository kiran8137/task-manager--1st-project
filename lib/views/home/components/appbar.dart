 
import 'package:flutter/material.dart';
import 'package:manage_your/utils/apps_str.dart';
import 'package:manage_your/views/home/components/calender/calender.dart';
import 'package:manage_your/views/home/components/search/searchscreen.dart';

PreferredSize appbar(GlobalKey<ScaffoldState>key, BuildContext context){
   int tabindex = 0;
  //bool isSearchvVisible = false;
  return PreferredSize(
    preferredSize: const Size.fromHeight(110),
    
     child: SizedBox(
    
      width: double.infinity,
      height: 250,
       
      
      child:  SafeArea(
        child: Column(
          
          children: [
             SizedBox(
              //height: 30,
            height:  MediaQuery.of(context).size.height * 0.02,
              ),
            Row(
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
                   child:
                  //  ImageIcon(
                  //   AssetImage("assets/menu.png",
                    
                  //   ),
                  //   size: 17,
                  //   //color:Theme.of(context).iconTheme.color,
                  //  )
                   SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,// 18,
                        width:  MediaQuery.of(context).size.width * 0.04,//18,
                        child: Image.asset("assets/menu.png",
                        color: Colors.white
                        // Theme.of(context).colorScheme.onSurface),
                       ),
                 ),
                 ),
            
            
                //Home
                  GestureDetector(
                    onTap: () {
                      //todo navigation to home
                      //print("home");
                    },
                    child: 
                  //    const ImageIcon(
                  //   AssetImage("assets/home.png",
                  //   ),
                  //   size: 17,
                  //  )
                     SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,//18,
                      width: MediaQuery.of(context).size.width * 0.04,//18,
                      child: Image.asset("assets/home.png",
                      color: Colors.white,),
                    )
                  ),
            
            
                   const Text(
                    AppStrings.appName,
                    style: 
                    //Theme.of(context).textTheme.bodyMedium
                     TextStyle(color: Colors.white, 
                     fontSize: 16
                    ),
                  ),
            
            
                  //search
                   GestureDetector(
                    onTap: () {
            
                       //togglesearch(!isSearchvisible);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  const SearchScreen()));
                        
                      //todo search
                      //print("search");
                    },
                    child:  const Icon(
                      Icons.search,
                      color:Colors.white
                      //Theme.of(context).iconTheme.color
                    ),
                  ),
                   
                  
            
                  //calender
            
                    GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const CalenderScreen()));
                      //todo navigation to calender
                      //print(" calendar");
                    },
                    child: const Icon(
                      Icons.calendar_month,
                      color: Colors.white
                      //Theme.of(context).iconTheme.color
                    ),
                  ),
                  
            
              
              ],
            ),

              TabBar(
              onTap: (index){
                tabindex = index;
                print(tabindex);
              },
              
              indicatorColor: Colors.blue,
              tabs: const [
                Tab(
                  iconMargin: EdgeInsets.all(0),
                  //icon:  Icon(Icons.home),
                   child: Text('Tasks',style: TextStyle(color: Colors.white),),
                ),
                 Tab(
                   child: Text('Events',style: TextStyle(color: Colors.white),),
                )
              ])
          ],
        ),
      ),
      
     ));
}