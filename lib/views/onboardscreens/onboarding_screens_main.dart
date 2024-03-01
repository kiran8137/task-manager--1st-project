import 'package:flutter/material.dart';
import 'package:manage_your/views/onboardscreens/onboardscreen1.dart';
import 'package:manage_your/views/onboardscreens/onboardscreen2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

 

class MainOnboarding extends StatefulWidget {
   const MainOnboarding({super.key});

  @override
  State<MainOnboarding> createState() => MainOnboardingState();
}

class MainOnboardingState extends State<MainOnboarding> {
  final _controller = PageController(initialPage: 0);

   // ignore: unused_field
   int _activepage = 0;

   final List<Widget> _pages = [
    const OnboardingScreen1(),
    const OnboardingScreen2(),
   ];

   
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body:  Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (int page){
              setState(() {
                _activepage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder:   (context, index) {
              return _pages[index % _pages.length]; 
            }
          


          ),
          Positioned(
            bottom: 120,
            
            child: SizedBox(
              height: 10,
              
              child: SmoothPageIndicator(controller: _controller,
                         count: _pages.length,
                         effect: const SlideEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: Colors.white,
                          activeDotColor: Colors.black,
                           
                         ),
                         ),
            ),
           )
          
          //  SmoothPageIndicator(controller: _controller,
          //  count: _pages.length)
        ],
        ),
                 
      
        
       
    );
    
    
  }
}