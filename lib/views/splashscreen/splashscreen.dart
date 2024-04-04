import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:manage_your/model/username_model/username.dart';
import 'package:manage_your/views/home/homeview.dart';
import 'package:manage_your/views/onboardscreens/onboarding_screens_main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
void initState() {
    // TODO: implement initState
    super.initState();

    navigateOnboarding();
  }

  navigateOnboarding()async{
   
   final usernamebox = await Hive.openBox<Username>('username_db');

   final isusername =  usernamebox.get('1');
   //print(isusername?.name);   

   if(isusername?.nameentered == true){
     await Future.delayed(const Duration(milliseconds: 1500),(){});
     Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context)=>  Homeview(username: isusername?.name,)));
   }else{

       await Future.delayed(const Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context)=> const MainOnboarding()));
   }
    
   
  }

   
  
  @override
  Widget build(BuildContext context) {

  //  final userprefsbox = Hive.box('userprefs_db');
  //  final bool onboard = userprefsbox.get('showonboarding')?? false;
  //  final bool profileAdded = userprefsbox.get('usernameadded') ?? false;

  //  if(onboard && profileAdded){
  //     Navigator.push(context, (MaterialPageRoute(builder: (context)=>Homeview())));
  //  }else{
  //   navigateOnboarding();
  //  }

    return   Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 111, 205),

       body: Container(
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
             // Below is the code for Linear Gradient.
           decoration: const BoxDecoration(
               gradient: LinearGradient(
               colors: [Color.fromARGB(255, 124, 30, 141), Colors.blue,],

              begin: Alignment.bottomLeft,
               end: Alignment.topRight,
          ),
        ),
        child: SizedBox(child: 
        Image.asset("assets/logopng.png",
        color: Colors.white,),
        
        ),
       )
    );
      
      // body: Center(
      //   child: Text("Manage You",
      //   style: TextStyle(
      //     fontSize: 30,
      //     color: Colors.white
      //   ),
      //   ),
      // ),
    
 
  }
}