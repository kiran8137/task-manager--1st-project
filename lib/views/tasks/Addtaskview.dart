import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manage_your/data/category/categoryfunctions.dart';
import 'package:manage_your/data/task/taskfunctions.dart';
import 'package:manage_your/model/task/task.dart';
import 'package:manage_your/notification/awsmnotif.dart';
import 'package:manage_your/utils/apps_str.dart';

class Addtaskview extends StatefulWidget {
 
  const Addtaskview({super.key});

 
 
  @override
  State<Addtaskview> createState() => _AddtaskviewState();
}

class _AddtaskviewState extends State<Addtaskview> {

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
String defaultime = "5";

 String? remindertime; 

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





//task creation
  Future<void> onCreate()async{
    final tasktitle = _titlecontroller.text.trim();
    final taskdescription = _descriptioncontroller.text.trim();
    if(tasktitle.isEmpty || taskdescription.isEmpty || defaultcategory!.isEmpty || defaultcategory == "Category" ){
      return;
    } 
    //print('$tasktitle $taskdescription');

    final task = Tasks(
       
      tasktitle: tasktitle , 
      taskdescription: taskdescription, 
      date: pickeddate ?? DateTime.now(),
      time: formattedTime,
      category: defaultcategory,
      reminderTime: remindertime ?? defaultime
      // datetime: combinedDateTime,
      
      
          
          );
    addtask(task);
  }

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
                  margin:  EdgeInsets.only(
                    //top: 40
                    top: MediaQuery.of(context).size.height * 0.04
                    ),
                  width: MediaQuery.sizeOf(context).width * 80 / 100,
                  height: 50,
                  //color: Colors.red,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.white))),
                  child:  Center(
                    child: Text(
                      AppStrings.newtask,
                      style: TextStyle(
                          fontSize:  MediaQuery.of(context).size.width * 0.05,//20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                 SizedBox(
                  width: MediaQuery.of(context).size.width, 
                  height: MediaQuery.of(context).size.height * 0.050,
                  // width: double.infinity,
                  // height: 50,
                ),
                Container(
                  ///
                  margin:  EdgeInsets.only(left: 0, right: MediaQuery.of(context).size.width*0.67),
                  child:  Text(
                    AppStrings.tasktitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,//17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                  SizedBox(
                  height:  MediaQuery.of(context).size.height * 0.01//7,
                ),
                Container(
                 // padding: const EdgeInsets.all(10),
                   // margin: EdgeInsets.only(left: 10, ),
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height * 0.09,//70,
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
                          border: InputBorder.none, hintText: "Add Task Name..."),
                    ),
                  ),
                ),
                  SizedBox(
                  height: 
                  MediaQuery.of(context).size.height * 0.02,
                  //20,
                ),
                Container(
                  //////
                  margin:  EdgeInsets.only(left: 0, 
                  right: MediaQuery.of(context).size.width*0.63
                  //right: 265
                  ),
                  child:   Text(
                    AppStrings.descriptioninput,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,//17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                 SizedBox(
                  //height: 7,
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  //margin: EdgeInsets.only(left: 0,right: 75),
                  width: MediaQuery.of(context).size.width - 40,
                  height:  MediaQuery.of(context).size.height * 0.09,//70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: _descriptioncontroller,
                    validator: (value) {
                       if (value == null || value.isEmpty) {
                           return 'Please enter a task description';
                          }
                          return null;
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Add description...'),
                  ),
                ),
                 SizedBox(
                  //height: 20,
                  height: MediaQuery.of(context).size.height*0.03,
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
                    
                          child:   Text(
                            AppStrings.date,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width * 0.04,//17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                    
                          SizedBox(
                          height: MediaQuery.of(context).size.height*0.01//7,
                        ),
                    
                        Container(
                         // padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 3),
                          width: MediaQuery.of(context).size.width * 40 / 100,
                          height: MediaQuery.of(context).size.height * 0.05,//43,
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
                              firstDate:DateTime.now(), 
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
                    
                          child:   Text(
                            AppStrings.time,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width * 0.04,//17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                    
                          SizedBox(
                          height: MediaQuery.of(context).size.height*0.01//7,
                        ),
                    
                        Container(
                          //padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 0),
                          width: MediaQuery.of(context).size.width * 40 / 100,
                          height: MediaQuery.of(context).size.height * 0.05,//43,
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
                  SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012//10,
                ),

                 

                
                Row(
                  children: [
                      SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06//24,
                    ),

                    SizedBox(
                      child: Text(defaultcategory!,
                      style:  TextStyle(color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.05,//20
                      ),),
                    ),

                      SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03//10,
                    ),
                    
                
                
                    // Category section
                    DropdownButton(
                      
                        dropdownColor: const Color.fromARGB(255, 9, 8, 79),
                        value: selectedCategory,
                        items: items.map((items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                          
                        onChanged: (String? newValue) {
                          setState(() {
                            //defaultcategory = newValue;
                            //catergoryName = newValue;
                           // categoryCreate(catergoryName);
                           if(newValue!='CREATE NEW'){
                             //selectedCategory = newValue;
                             defaultcategory = newValue;
                           }else{
                            showDialog(
                                context: context, 
                                builder: (ctx)=>
                                AlertDialog(
                                  title: const Text("Create New Category"),
                                  content: TextField(
                                    
                                    controller: _categorycontroller,
                                    // onChanged: (value){
                                    //   setState(() {
                                    //     // newCategory=value;
                                    //    // catergoryName = value;
                                    //     selectedCategory = value;
                                    //    // categoryCreate(catergoryName);
                                         
                                    //   }
                                    //   );
                                     
                                     
                                    // },
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed:(){
                                        Navigator.of(context).pop();
                                      }, 
                                      child: const Text("Cancel"),
                                      ),
                                      TextButton(
                                      
                                      onPressed:(){

                                          String newCategory =
                                      _categorycontroller.text.trim().toLowerCase();
                                  if (newCategory.isNotEmpty && items.contains(newCategory) ) {
                                    setState(() {
                                      defaultcategory = newCategory;
                                    });
                                    print("already added");
                                     showDialog(
                                      context: context, builder: (ctx)=>
                                      const AlertDialog(
                                        title: Text("Category already added"),
                                      )
                                      );
                                      
                                    // items.add(newCategory);
                                    // selectedCategory = newCategory;
                                  }else if(_categorycontroller.text.isNotEmpty){
                                    items.add(newCategory);
                                    categoryCreate(newCategory);
                                  
                                  }
                                  

                                  setState(() {
                                     if(_categorycontroller.text.isNotEmpty){
                                      defaultcategory = newCategory;
                                     }
                                    //  defaultcategory = newCategory;
                                  });
                                   
                                  //        setState(() {
                                  //         String newCategory =
                                  //     _categorycontroller.text.trim().toLowerCase();
                                  // if (newCategory.isNotEmpty && items.contains(newCategory)) {
                                  //    showDialog(
                                  //     context: context, builder: (ctx)=>
                                  //     const AlertDialog(
                                  //       title: Text("Category already added"),
                                  //     )
                                  //     );
                                  //   // items.add(newCategory);
                                  //   // selectedCategory = newCategory;
                                  // }
                                  //  items.add(newCategory);
                                  // selectedCategory = newCategory;
                                  //     });
                                        Navigator.of(context).pop();
                                        _categorycontroller.clear();
                                  
                                      }, 
                                      child: const Text("Create"),
                                      )
                                      
                                  ],
                                )
                                  
                                
                
                                );
                           }
                           
                            
                
                          },
                          );
                        },

                        
                        ),
                  ],
                ),
                // const SizedBox(
                //   height: 15,
                // ),
                    
                    
                  SizedBox(
                  width: MediaQuery.of(context).size.width * 0.06//24,
                ),
                    
                
                GestureDetector(
                  onTap: () {
                    //print("reminder");
                  },
                  child: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: timings[0],
                        child: Text(timings[0]),
                      ),
                      PopupMenuItem(
                        value: timings[1],
                        child: Text(timings[1]),
                      ),
                      PopupMenuItem(
                        value: timings[2],
                        child: Text(timings[2]),
                      ),
                      PopupMenuItem(
                        value: timings[3],
                        child: Text(timings[3]),
                      ),
                      PopupMenuItem(
                        value: timings[4],
                        child: Text(timings[4]),
                      ),
                      PopupMenuItem(
                        value: timings[5],
                        child: Text(timings[5]),
                      ),
                    ],
                    onSelected: (String newvalue) {
                      setState(() {
                       
                        subtitle = newvalue;
                      });
//                       final timings = [
//   '5 minutes before',
//   '10 minutes before',
//   '15 minutes before',
//   '30 minutes before',
//   '1 day before',
//   '2 days before'
// ];
                    
                      if(newvalue == '5 minutes before'){
                        remindertime = '5';
                      }else if(newvalue == '10 minutes before'){
                        remindertime = '10';
                      }
                      else if(newvalue == '15 minutes before'){
                        remindertime = '15';
                      }
                      else if(newvalue == '30 minutes before'){
                        remindertime = '30';
                      }
                      else if(newvalue == '1 day before'){
                        remindertime = '1';
                      }
                      else if(newvalue == '2 day before'){
                        remindertime = '2';
                      }
                        
                    },
                    child: ListTile(
                  leading: const Icon(Icons.edit_notifications_outlined,
                  color: Colors.white,
                  size: 30,
                  ),
                  title:   Text("Reminder At",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,//17
                      ),
                      ),
                      subtitle:Text(subtitle,
                      style: const TextStyle(color: Colors.white),)
                      ),
                  //   child: Text("Reminder At",
                  //       style: TextStyle(color: Colors.white, fontSize: 18)),
                   ),
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  // 118,
                ),
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
                          height: MediaQuery.of(context).size.width * 0.1,//40,
                          width:  MediaQuery.of(context).size.width * 0.32,//130,
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
                          height: MediaQuery.of(context).size.width * 0.1,//40,
                          width:  MediaQuery.of(context).size.width * 0.32,//130,
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

                                       onCreate();
                                      if(pickeddate!=null && pickedtime!=null){
                                        int day = pickeddate!.day;
                                        int month = pickeddate!.month;
                                        int year = pickeddate!.year;
                                        int hour = pickedtime!.hour;
                                        int minute = pickedtime!.minute;
                                        NotificationService.showNotification(
                                          title: taskname, 
                                          body: description ,
                                          day: day,
                                          month: month,
                                          year: year,
                                          hour: hour,
                                          minute: minute,
                                          
                                            );
                                      }
                                      
                                      
                                       print(pickedtime);
                                    Navigator.pop(context);
                                   

                                    //DateTime selectedtime = 
                                   // DateTime _selectedreminder = DateTime(pickedtime!.hour, pickedtime!.minute).subtract(Duration(minutes: int.parse(remindertime!)));
                                    
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
                                "Create",
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
