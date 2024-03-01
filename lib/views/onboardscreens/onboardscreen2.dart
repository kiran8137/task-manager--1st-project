 

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_your/views/profiecreation/profilescreen1.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 55 / 100,
            width: MediaQuery.of(context).size.width,
            color:  Colors.blue,
            child: Stack(
              children: [
                Positioned(
                    left: 50,
                    top: 100,
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      //color: Colors.white,
                      child: Image.asset("assets/onboarding2.png",
                      fit: BoxFit.cover,)))
              ],
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
                        "Congratulations!",
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
                        "You're ready to start using “Manage You” to manage your tasks and stay             organized.",
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
                
                    // Text(
                    //     "category, priority, or due date.",
                    //     style: TextStyle(
                    //       letterSpacing: 1,
                    //         fontSize: 20,
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.w400,
                    //         shadows: [
                    //           Shadow(
                    //             blurRadius: 10.0,
                    //             // color of the shadow
                    //             color: Colors.black,
                    //             offset: Offset(1, 1),
                    //           ),
                    //         ],
                    //         ),
                
                    //   ),
                
                      //  Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text('data'),
                      //   ],
                      //  )
                      
                    ],
                  ),
                ),

                Positioned(
                  bottom: 35,
                  
                  right: 150,
                  child:  SizedBox(
                    width: 80,
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async{
                          // final userprefsbox = Hive.box('userprefs_db');
                          // await userprefsbox.put('showonboarding', true);
                            //lets go
                            Navigator.push(context , CupertinoPageRoute(builder: (context)=> ProfileScreen()));
                           // print("Let's go");
                            //  navigate to create profile page
                          },
                          child: const Text("Lets'go",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                        const Icon(Icons.keyboard_double_arrow_right_outlined,
                        size: 20,color: Colors.white,)
                      ],
                    ),
                  ) )
              ],
            ),
          ),

           
        ],
      ),
    );
  }
}
