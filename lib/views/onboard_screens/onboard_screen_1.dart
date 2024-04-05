 

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_your/views/profile_create_screen/profile_screen.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 55 / 100,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 13, 93, 65),
            child:  Stack(
              children: [
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.06,//30,
                  top: MediaQuery.of(context).size.height * 0.05,//50,
                  child:  SizedBox(
                    width: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                          //    final userprefsbox = Hive.box('userprefs_db');
                          // await userprefsbox.put('showonboarding', true);
                            //Skip
                            Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context)=>  ProfileScreen()));
                           // print("skip");
                            //skip and navigate to create profile page
                          },
                          child: const Text("skip",
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                        ),
                        const Icon(Icons.keyboard_double_arrow_right_outlined,
                        size: 15,color: Colors.white,)
                      ],
                    ),
                  ),
                  ),


                  Positioned(
                    left: 50,
                    top: 100,
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      //color: Colors.white,
                      child: Image.asset("assets/onboarding1.png",
                      fit: BoxFit.cover,)))
              ]
              ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 45 / 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(8),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Organize Your Tasks",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                // color of the shadow
                                color: Colors.black,
                                offset: Offset(1, 1),
                              ),
                            ]),
                      ),
                
                      SizedBox(height: 15),
                
                      Text(
                        "Keep your tasks organized by",
                        style: TextStyle(
                          letterSpacing: 1,
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                // color of the shadow
                                color: Colors.black,
                                offset: Offset(1, 1),
                              ),
                            ],
                            ),
                      ),
                
                      SizedBox(height: 4),
                
                    Text(
                        "category, priority, or due date.",
                        style: TextStyle(
                          letterSpacing: 1,
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                // color of the shadow
                                color: Colors.black,
                                offset: Offset(1, 1),
                              ),
                            ],
                            ),
                
                      ),
                
                      //  Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text('data'),
                      //   ],
                      //  )
                      
                      
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 35,
                  
                  right: 160,
                  child:  SizedBox(
                    width: 70,
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // GestureDetector(
                        //   onTap: (){

                        //     //next

                        //     Navigator.push(context, CupertinoPageRoute(builder: (context)=> const onboardingScreen2()));
                        //     print("next");
                        //     //Navigate to next onboarding screeen
                        //   },
                        //   child: const Text("Next",
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.w500
                        //   ),),
                        // ),
                        // Icon(Icons.keyboard_double_arrow_right_outlined,
                        // size: 20,color: Colors.white,)
                      ],
                    ),
                  ) ,
                  )
              ],
            ),
          ),

           
        ],
      ),
    );
  }
}
