import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:manage_your/data/functions.dart';
import 'package:manage_your/model/task.dart';
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/views/home/components/appbar.dart';
import 'package:manage_your/views/home/widgets/taskwideget.dart';
import 'package:manage_your/views/settings/settings.dart';
import 'package:manage_your/views/tasks/Addtaskview.dart';
 


class Homeview extends StatefulWidget {
  const Homeview({super.key,this.username});

  final String? username;

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {

final GlobalKey<ScaffoldState> _key = GlobalKey();
//TextEditingController searchController = TextEditingController();
TextEditingController titleEditingController = TextEditingController();
TextEditingController descriptionEditingController = TextEditingController();
TextEditingController searchController = TextEditingController();

 


 

// method to remove task from the list
//  void _remove(index)async{
//    final box = await Hive.openBox<Tasks>('task_db');
//    box.deleteAt(index);
//   tasklistNotifier.value = box.values.toList();
//  }



 bool _isSearchvisible = false;

//  void togglesearch(isSearchvisible){
//   setState(() {
//     _isSearchvisible = isSearchvisible;
//   });
//  }

 
 
  @override
  Widget build(BuildContext context) {
     getAllTasks();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
       Colors.black,
      //Theme.of(context).colorScheme.primary,
      

      //floating Action button
      floatingActionButton:  GestureDetector(
      onTap: (){
       // displaybottomsheet(context);
       Navigator.push(context,MaterialPageRoute(builder: (context) =>   const Addtaskview()));
       // print("fab tapped");

       //Navigator.pop(context, MaterialPageRoute(builder: (context)=> const addtask()));
      },
      child: Container(
        
           //width: 600,
          width: MediaQuery.sizeOf(context).width * 60 / 100,
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
             
            borderRadius: BorderRadius.circular(10),
            color: Appcolors.buttonColor,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add New Text",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              )
            ],
          ),
          ),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

       key: _key,


       
    appBar: appbar(_key, context,),


    //side menu

    drawer:  Drawer(
      backgroundColor:  const Color.fromARGB(255, 43, 118, 204),
      child: ListView(
        children: [
          
           SizedBox(height: MediaQuery.of(context).size.height * 0.1),
           DrawerHeader(
            
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.only(left: 8),
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                 // Icon(Icons.close),

                  const SizedBox(height: 5,),
                   Text("Hello , Mr ${widget.username}",style: TextStyle(fontSize: 20,color: Colors.white),
                  ),
              
                  const SizedBox(height: 10,),
              
              
                  Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: const Color.fromARGB(145, 57, 91, 155), width: 5)),
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
                ],
              ),
            ),
            ),

          ListTile(
            leading: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Homeview()));
              },
              child: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/home.png",color: Colors.white,)),
            ),
            title: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Homeview()));
              },
              child: const Text("Home",style: TextStyle(color: Colors.white),)),
          ),

          ListTile(
            leading: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Homeview()));
              },
              child: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/setting.png",color: Colors.white,),
                ),
            ),
              title: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                },
                child: const Text("Settings",style:  TextStyle(color: Colors.white),)),
          )
        ],
      ),
    ),
    
      

      //body

      body:_buildhomebody(_isSearchvisible),
    );
  }
      //homebody
  Widget _buildhomebody(SearchVisible) {
    bool isSearchvisible = SearchVisible;
    return SingleChildScrollView(
      child: Column(
       
        children: [
      
           
          
          //appbar 
          
          // Container(
          //   margin: const EdgeInsets.only(top: 23),
          //   width: double.infinity,
          //   height: 90,
          //   color: Colors.black,
          //   // color: Colors.red,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       GestureDetector(
          //         onTap: () {
                    
          //           //todo sidebar
          //           print("menu");
          //         },
          //         child:
          //         SizedBox(
          //           height: 18,
          //           width: 18,
          //           child: Image.asset("assets/menu.png",
          //           color: Colors.white,),
          //         ),
          //         //  const Icon(
          //         //   Icons.menu,
          //         //   color: Colors.white,
          //         // ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           //todo navigation to home
          //           print("home");
          //         },
          //         child:  SizedBox(
          //           height: 18,
          //           width: 18,
          //           child: Image.asset("assets/home.png",
          //           color: Colors.white,),
          //         )
          //       ),
          //       const Text(
          //         AppStrings.appName,
          //         style: TextStyle(color: Colors.white, fontSize: 16),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           //todo search
          //           print("search");
          //         },
          //         child: const Icon(
          //           Icons.search,
          //           color: Colors.white,
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           //todo navigation to calender
          //           print(" calendar");
          //         },
          //         child: const Icon(
          //           Icons.calendar_month,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
           const Divider(
            
            // Theme.of(context).colorScheme.secondary,
            thickness: 0.8,
          ),
      
          
      
          const SizedBox(height:5,),
      

      //searchbar 

           //searchOptionbar(isSearchvisible, searchController),
           
          
          //Tasks
          SizedBox(
            width: double.infinity,
            height: 600,
            child:  
            ValueListenableBuilder(
              valueListenable: tasklistNotifier,
              builder: 
              (BuildContext context, List<Tasks> tasklist , Widget? child ){
                return  ListView.builder(
                itemCount: tasklist.length,
                itemBuilder: (context, index) {
                  final data = tasklist[index];
                  print(data.date);
                  return
                   Slidable(
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.15,
                      
                       children: [
                        SlidableAction(
                          onPressed: (context)=>{
                            showDialog(
                              context: context, 
                              builder: (ctx)=>
                               AlertDialog(
                                title: const Text("Alert....!"),
                                content: const Text("Sure You Want to Delete This Task"),
                                actions: [
                                  TextButton(
                                  onPressed: (){
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text("Cancel")
                                  ),
                                  TextButton(
                                    onPressed:(){
                                      remove(index);
                                    //  Navigator.of(context).pop();
                                    }, 
                                    child: const Text("Ok"),
                                    ),
                                ],
                              )
                              )
                            //_remove(index)
                          },
                          
                          icon: CupertinoIcons.delete,
                          
                           
                          )
                       ]),
                    child:  Taskwidget(
                      tasktitle: data.tasktitle,
                      taskdescription: data.taskdescription,
                      date: data.date,
                      time: data.time,
                      category : data.category,
                      index : index
                       
                      
                      
                    
                      
                    ),
                    
                    );
                    
                },
              );
              },
                
            )
            // :const Center(
            //   child: Text("NO TASK YET",style: TextStyle(color: Colors.white),),
            // )
          )
        ],
      ),
    );
  }

//  
 }





// PreferredSize appbar(){
//   return PreferredSize(
//     preferredSize: Size.fromHeight(80),
//      child: Container(
//       color: Colors.red,
//      ));
// }




 