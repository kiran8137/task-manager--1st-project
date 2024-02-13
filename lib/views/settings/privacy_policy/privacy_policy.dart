import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(

            //go back to setting page
            onTap: (){
              Navigator.pop(context);
            },
            child:  Icon(Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,),
            ),
          backgroundColor:  Theme.of(context).colorScheme.background,
          title:   Text(
            "Privacy and Policy",
            style: Theme.of(context).textTheme.bodyLarge
            //TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor:Theme.of(context).colorScheme.background,



        
        body:  SizedBox(
          height: 800,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Introduction",
                    style: Theme.of(context).textTheme.displaySmall,
                    //TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Thank you for choosing our Offline Task Manager App (Manage You)."
                    "This Privacy Policy is intended to inform you about the types of information we collect and how we use and protect that information."
                    "Your privacy is important to us, and we are committed to ensuring the confidentiality and security of any personal information you provide",
                    style: Theme.of(context).textTheme.bodyLarge,
                    // TextStyle(color: Colors.white, fontSize: 18),
                  ),



                  SizedBox(height: 20),
                  Text(
                    "Information We Collect:",
                    style: Theme.of(context).textTheme.displaySmall
                    // TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Name: We collect your name solely for the purpose of personalizing your experience within the App."
                     "This information is stored locally on your device and is not transmitted to any external servers.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    // TextStyle(color: Colors.white, fontSize: 18),
                  ),

                        
                   SizedBox(height: 20),
                  Text(
                     "How We Use Your Information:",
                    style:Theme.of(context).textTheme.displaySmall,
                    // TextStyle(color: Colors.white, fontSize: 20),
                  ),
                                               
                  SizedBox(height: 10),
                  Text(
                     "Personalization: Your name is used within the App to personalize your experience and make it more user-friendly",
                    style: Theme.of(context).textTheme.bodyLarge,
                    // TextStyle(
                    //   color: Colors.white, fontSize: 18),
                  ),
                      
                      
                      
                  SizedBox(height: 20),
                  Text(
                     "Data Storage and Security:",
                    style: Theme.of(context).textTheme.displaySmall,
                    // TextStyle(color: Colors.white, fontSize: 20),
                  ),

                  SizedBox(height: 10),
                  Text(
                     "Local Storage: All information collected, including your name, is stored locally on your device. We do not store any personal information on external servers.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    //TextStyle(color: Colors.white, fontSize: 18),
                  ),


                
                   SizedBox(height: 20),
                  Text(
                     "Information Sharing:",
                    style: Theme.of(context).textTheme.displaySmall,
                    //TextStyle(color: Colors.white, fontSize: 20),
                  ),

                  SizedBox(height: 10),
                  Text(
                     "No External Sharing: We do not share your personal information with any external third parties.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    // TextStyle(color: Colors.white, fontSize: 18),
                  ),



                SizedBox(height: 20),
                  Text(
                     "Changes to the Privacy Policy:",
                    style:Theme.of(context).textTheme.displaySmall,
                    // TextStyle(color: Colors.white, fontSize: 20),
                  ),

                  SizedBox(height: 10),
                  Text(
                     "Any changes made to this Privacy Policy will be communicated through the App. By continuing to use the App, you acknowledge and agree to the updated Privacy Policy.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    //TextStyle(color: Colors.white, fontSize: 18),
                  ),


                  SizedBox(height: 20),
                  Text(
                     "Contact Us:",
                    style: Theme.of(context).textTheme.displaySmall,
                    //TextStyle(color: Colors.white, fontSize: 20),
                  ),

                   SizedBox(height: 10),
                  Text(
                     "If you have any questions or concerns about this Privacy Policy or the App's privacy practices, please contact us at [kirankpalakkad@gmail.com].",
                    style:Theme.of(context).textTheme.bodyLarge,
                    // TextStyle(color: Colors.white, fontSize: 18),
                  ),


                ],
              ),
            ),
          ),
        ));
  }
}
