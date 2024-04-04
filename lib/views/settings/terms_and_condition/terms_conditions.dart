import 'package:flutter/material.dart';

class TermsConditonview extends StatelessWidget {
  const TermsConditonview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(

            //go back to setting page
            onTap: (){
              Navigator.pop(context);
            },
            child:  const Icon(Icons.arrow_back,
            color:  Colors.white),
            ),
          backgroundColor:   Colors.black,
          title:   const Text(
            "Terms and Conditions",
            style:  
            TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,



        
        body:    SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Terms and Conditions",
                    style: 
                    TextStyle(color: Colors.white,
                     fontSize: MediaQuery.of(context).size.width * 0.05,//20
                     ),
                  )),
                    SizedBox(
                    height:  MediaQuery.of(context).size.height * 0.01,//10,
                  ),
                    Text(
                    "Welcome to Manage You! Before you start using our application, please read these Terms and Conditions carefully. By accessing or using Manage You, you agree to be bound by these Terms and Conditions. ",
                    style: 
                     TextStyle(color: Colors.white, 
                     fontSize:  MediaQuery.of(context).size.width * 0.048,//18
                     ),
                  ),



                    SizedBox(
                    height:  MediaQuery.of(context).size.height * 0.02,//20
                    ),
                    Text(
                    "Introduction",
                    style: 
                     TextStyle(color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.05,//20
                      ),
                  ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,//10
                    ),
                    Text(
                    "Manage You is an offline task and event manager application designed to help users organize their tasks and events efficiently. By using Manage You, you acknowledge that you have read, understood, and agree to abide by these Terms and Conditions. If you do not agree with any part of these Terms and Conditions, please do not use Manage You.",
                    style:  
                     TextStyle(color: Colors.white,
                      fontSize:  MediaQuery.of(context).size.width * 0.048,//18
                      ),
                  ),

                        
                     SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,//20
                    ),
                  const Text(
                     "User Information",
                    style: 
                     TextStyle(color: Colors.white, fontSize: 20),
                  ),
                                               
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,//10
                    ),
                   Text(
                     "Manage You collects only the user's name for personalization purposes and image for event section in the application and does not require any sign-in process or access to personal information such as email addresses or social media profiles.",
                    style:  
                    TextStyle(
                      color: Colors.white, 
                      fontSize: MediaQuery.of(context).size.width * 0.048,//18
                      ),
                  ),
                      
                      
                      
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,//20
                    ),
                  const Text(
                     "Limitation of Liability ",
                    style:  
                     TextStyle(color: Colors.white, fontSize: 20),
                  ),

                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,//10
                    ),
                    Text(
                     "You are solely responsible for maintaining the confidentiality of your username and any activities that occur under your username. You agree to notify us immediately of any unauthorized use of your username or any other breach of security.",
                    style:  
                    TextStyle(color: Colors.white, 
                    fontSize: MediaQuery.of(context).size.width * 0.048,//18
                    ),
                  ),


                
                     SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,//20
                    ),
                    Text(
                     "Limitation of Liability",
                    style:  
                    TextStyle(color: Colors.white, 
                    fontSize: MediaQuery.of(context).size.width * 0.05,//20
                    ),
                  ),

                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,//10
                    ),
                    Text(
                     "Manage You and its developers shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses",
                    style:  
                     TextStyle(color: Colors.white, 
                     fontSize: MediaQuery.of(context).size.width * 0.048,//18
                     ),
                  ),



                  SizedBox(
                  height:  MediaQuery.of(context).size.height * 0.02,//20
                  ),
                    Text(
                     "Changes to Terms and Conditions",
                    style:
                    TextStyle(color: Colors.white,
                     fontSize: MediaQuery.of(context).size.width * 0.05,//20
                     ),
                  ),

                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,//10
                    ),
                    Text(
                     "We reserve the right to modify or replace these Terms and Conditions at any time. Any changes will be effective immediately upon posting the revised Terms and Conditions on Manage You. Your continued use of Manage You after any such changes constitutes your acceptance of the new Terms and Conditions.",
                    style: 
                    TextStyle(color: Colors.white, 
                    fontSize: MediaQuery.of(context).size.width * 0.048,//18
                    ),
                  ),


                    SizedBox(
                    height:  MediaQuery.of(context).size.height * 0.05,//20
                    ),
                     

                      
                    Text(
                     "By using Manage You, you agree to these Terms and Conditions. Thank you for using Manage You!",
                    style: 
                     TextStyle(color: Colors.white, 
                     fontSize: MediaQuery.of(context).size.width * 0.048,//18
                     ),
                  ),


                ],
              ),
            ),
          ),
        ));
  }
}
