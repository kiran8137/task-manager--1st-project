import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
import 'package:manage_your/Hive_model/username_database_model/username.dart';
import 'package:manage_your/controller/database_controller/user_profile_controller.dart';
 
 
import 'package:manage_your/views/home_screen/home_screen_view.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  final _usernamecontroller = TextEditingController();


  
  final _formkey = GlobalKey<FormState>();


  // Future<void> _adduserprofile() async{
  //   final userprofileName = _usernamecontroller.text.trim();

  //   final username = Userprofile(name: userprofileName);
  //   addprofile(username);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // Below is the code for Linear Gradient.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 69, 25, 108),
              Colors.white,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [
              0.1,
              0.2,
            ],
          ),
        ),

        child: Stack(
          children: [
            Positioned(
              top: 160,
              left: 155,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: const Color.fromARGB(145, 242, 168, 168), width: 5)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Image.asset(
                      'assets/user.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 250,
              left: 90,
              child: Container(
                
                height: MediaQuery.of(context).size.height * 0.10,//70,
                width: MediaQuery.of(context).size.width * 0.55,//230,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(135, 158, 158, 158),
                    borderRadius: BorderRadius.circular(10)),
                child: Form(
                  key: _formkey,
                
                
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {
                       // String name = value;
                      }, 
                      decoration:  const InputDecoration(
                        hintText: "Enter your name",
                        border: InputBorder.none,
                         
                      ),
                      
                    
                      controller: _usernamecontroller,
                      
                      validator: (value){
                        if(value!.isEmpty ){
                          return "Enter a username";
                          
                        }
                        if (value.length < 3){
                          return " name must be at least 2 characters";
                          
                        }
                        return null;
                      }
                      
                    
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.2,//200,
                left: MediaQuery.of(context).size.width * 0.3,//100,
                child: GestureDetector(
                  onTap: () async{
                    if(_formkey.currentState!.validate()){
                        //final usernamedb = await Hive.openBox<Username>('username_db');
                        final username = Username(name: _usernamecontroller.text , nameentered: true , );
                         addusername(username);
                       
                      Navigator.push(context, CupertinoPageRoute(builder: (context) =>  Homeview(username: _usernamecontroller.text)));
                    //  _adduserprofile();
                    }
                    //else{
                     // print("user name is empty");
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text("Enter a username"))
                      // );
                   // }
                     
                   // print("submit");
                    //when submit navigate to home page
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,//40,
                    width: MediaQuery.of(context).size.width * 0.4,//180,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 4, 40),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
