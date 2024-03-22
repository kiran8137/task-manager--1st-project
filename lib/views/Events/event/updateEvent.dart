
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manage_your/data/category/categoryfunctions.dart';
import 'package:manage_your/data/task/taskfunctions.dart';
import 'package:manage_your/model/task/task.dart';
import 'package:manage_your/utils/apps_str.dart';

class Updateeventview extends StatefulWidget {
 
  const Updateeventview({super.key});

 
 
  @override
  State<Updateeventview> createState() => _UpdateeventviewState();
}

class _UpdateeventviewState extends State<Updateeventview> {

  final _formKey = GlobalKey<FormState>();



  final TextEditingController _titlecontroller = TextEditingController();//controller for title
  final TextEditingController _descriptioncontroller = TextEditingController();//controller for description
  final TextEditingController _datecontroller = TextEditingController();//controller for date
  final TextEditingController _timecontroller = TextEditingController();//controller for time
  final TextEditingController _categorycontroller = TextEditingController();

  
  String taskname = ""; //Task name by the user
  String description = ""; //description by the user
  String? catergoryName ="";//category selected by the user
 
  DateTime? pickeddate; //date selected by the user and sending to the database
  TimeOfDay? pickedtime; 

  String? formattedTime;//time selected by the user and sending to the database
  
  DateTime? parsedTime; 
  
  DateTime defaulttime = DateTime.now();
  
  

  String? defaultcategory = 'Category';
  String? selectedCategory;
  String newCategory = '';
  bool status = true;

  final timings = [
  '5 minutes before',
  '10 minutes before',
  '15 minutes before',
  '30 minutes before',
  '1 day before',
  '2 days before'
];
String subtitle = "5 minutes before ";


//  var items = ['No Category', 'Work', 'personal', 'Wishlist', 'Birthday','CREATE NEW']; //catergory list

//category creation
// Future<void> categoryCreate(String? catergoryName) async{
// final categroybox = await Hive.openBox<Category>('category_db');

  
//   var existingCategory = categroybox.values.where((element) =>
//   element.name == catergoryName,
//   ).toList();

//   if(existingCategory.isEmpty){
//     var newCategory = Category(name: catergoryName);
//     addCategory(newCategory);
//   }


// }





 

  @override
  Widget build(BuildContext   context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 9, 8, 79),
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(20),topRight: Radius.circular(20)
            // )
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                 Container(
                  margin: const EdgeInsets.only(top: 40),
                  width: MediaQuery.sizeOf(context).width * 80 / 100,
                  height: 50,
                  //color: Colors.red,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.white))),
                  child: const Center(
                    child: Text(
                      'Update Event',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(
                  width: double.infinity,
                  height: 50,
                ),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 185,
                     
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const  Text(
                    'Event Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                     Container(
                 // padding: const EdgeInsets.all(10),
                   // margin: EdgeInsets.only(left: 10, ),
                  width: 185,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      
                      style: const TextStyle(
                         
                      ),
                       controller: _titlecontroller,
                      validator: (value) {
                         if (value == null || value.isEmpty) {
                          return 'please enter the task description';
                            }
                          return null;
                      },
                      
                      decoration: const InputDecoration(
                          border: InputBorder.none,  ),
                    ),
                  ),
                ),
                      ],
                    ),
                  ),

                  Container(
                    height: 100,
                    width: 185,
                    
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                   'Event Location',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),

                  Container(
                 // padding: const EdgeInsets.all(10),
                   // margin: EdgeInsets.only(left: 10, ),
                  width: 185,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      
                      style: const TextStyle(
                         
                      ),
                       controller: _titlecontroller,
                      validator: (value) {
                         if (value == null || value.isEmpty) {
                          return 'please enter the task description';
                            }
                          return null;
                      },
                      
                      decoration: const InputDecoration(
                          border: InputBorder.none,  ),
                    ),
                  ),
                ),
                      ],
                    ),
                  )
                ],
               ),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("data"),
                        Container(
                          //////
                          margin: const EdgeInsets.only(
                            left: 3,
                          ),
                          width: MediaQuery.of(context).size.width * 30 / 100,
                    
                          // color: Colors.red,
                    
                    
                    
                          // selecting the date
                    
                          child: const Text(
                            AppStrings.date,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                    
                        
                    
                        Container(
                         // padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 3),
                          width: MediaQuery.of(context).size.width * 40 / 100,
                          height: 43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            
                          ),
                    
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            controller: _datecontroller,
                            readOnly: true,
                            
                            decoration:  InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                              // icon: Icon(Icons.calendar_month,color: Color.fromARGB(111, 158, 158, 158),
                              // ),
                              prefixIcon:  const Icon(Icons.calendar_month,color: Color.fromARGB(111, 158, 158, 158)),
                    
                              border: InputBorder.none,
                              
                              hintText: DateFormat('dd-MM-yyyy').format(defaulttime) ,
                              //"dd/mm/yy",
                              hintStyle: const TextStyle(color: Color.fromARGB(111, 158, 158, 158),
                              
                            ),
                          ),
                          onTap: ()async{
                
                            pickeddate = await showDatePicker(
                              
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000), 
                              lastDate: DateTime(2100),
                              );
                              // setState(() {
                              //   _datecontroller.text = DateTime.now().toString();
                              // });
                             // DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)
                              if(pickeddate!=null){
                                setState(() {
                
                                  _datecontroller.text = DateFormat('dd/MM/yyyy').format(pickeddate!);
                
                                });
                              }
                              // setState(() {
                              //   _datecontroller.text = DateTime.now().toString();
                              // });
                          },
                        ),
                        )
                      ]
                  ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("data"),
                        Container(
                          //////
                          margin: const EdgeInsets.only(
                            left: 0,
                          ),
                          width: MediaQuery.of(context).size.width * 30 / 100,
                    
                          // color: Colors.red,
                    
                    
                    
                          //selecting the time
                    
                          child: const Text(
                            AppStrings.time,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                    
                        
                    
                        Container(
                          //padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 0),
                          width: MediaQuery.of(context).size.width * 40 / 100,
                          height: 43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                    
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            controller: _timecontroller,
                            readOnly: true,
                            
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                              // icon: Icon(Icons.calendar_month,color: Color.fromARGB(111, 158, 158, 158),
                              // ),
                              prefixIcon:  Icon(Icons.access_time_outlined,color: Color.fromARGB(111, 158, 158, 158)),
                    
                              border: InputBorder.none,
                              hintText: "hh:mm",
                              hintStyle: TextStyle(color: Color.fromARGB(111, 158, 158, 158),
                              
                            ),
                          ),
                          onTap: ()async{
                            pickedtime = await showTimePicker(
                              context: context,
                               initialTime: TimeOfDay.now()
                               );
                               if(pickedtime!=null){
                
                            //  DateTime combinedDateTime = DateTime(
                            //     pickeddate!.day,
                            //     pickeddate!.month,
                            //     pickeddate!.year,
                            //     pickedtime!.minute,
                            //     pickedtime!.hour,
                                
                
                            //   );
                               
                               
                               // print(pickedtime!.format(context),
                                 parsedTime = DateFormat.jm().parse(pickedtime!.format(context).toString());
                                
                                //  print(parsedTime);
                    
                                   formattedTime = DateFormat('h:mm a').format(parsedTime!);
                                  //print(formattedTime);
                                setState(() {
                                  _timecontroller.text = formattedTime!;
                                });
                    
                                //pickeddate = DateFormat.jm().parse(pickedtime!.format(context).toString());
                                
                               }
                          },
                          
                          )
                        ),

                        
                      ],
                    ),
                ],
               ),

                Card(
                color: const Color.fromARGB(255, 220, 219, 219),
                child: SizedBox(
                  height: 230,

                  width: 350,
                  child: SizedBox(
                    width: 10,
                    height: 10,
                    child: Image.asset('assets/gallery.png',  )),
                ),
               ),

               Text("Tap to add an image",
               style: TextStyle(
                fontSize: 15,
                color: Colors.white
               ),
               ),

              SizedBox(height: 140,),

               Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //print("cancel");
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 9, 8, 79),
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                         // print("create");
                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Center(
                              child: GestureDetector(
                                onTap: (){

                                  
                                   if (_formKey.currentState!.validate()  ) {
                                    if(defaultcategory!=null && defaultcategory != 'Category'){
                                     
                                    Navigator.pop(context);
                                    }else{
                                      const snack = SnackBar(
                                      content: Text("Category not selected",
                                      style: TextStyle(color: Colors.black),),
                                      backgroundColor: Colors.white,
                                      elevation: 10,
                                      behavior: SnackBarBehavior.floating,
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(snack);
                                    }
                  // If the form is valid, proceed with form submission
                                  // onCreate();
                                  // Navigator.pop(context);
                                   }
                                    
                                    
                                   

                                   
                                },
                                child: const Text(
                                "Confirm",
                                 style: TextStyle(color: Colors.white),
                              ),
                              )),
                        ),
                      )
                    ],
                  ),
                )


 
                 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
