import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive/hive.dart';
import 'package:manage_your/model/event/event.dart';
import 'package:manage_your/model/task/task.dart';
import 'package:manage_your/views/Events/event/widget/eventwidget.dart';
import 'package:manage_your/views/home/homeview.dart';
import 'package:manage_your/views/home/widgets/taskwideget.dart';

class SearchScreen extends StatefulWidget {
  

  const SearchScreen({super.key,
   
  });

  
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}



class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchcontroller = TextEditingController();
  final _taskdb = Hive.box<Tasks>('task_db');
  final _eventdb = Hive.box<Event>('event_db');
  List<Tasks>tasksearchResult = [];
  List<Event>eventsearchResult = [];

  int _tabbarindex = 0;


  DateTime? start;
  DateTime? end;

void searchTask(String query){
query =  query.toLowerCase();
if(query.isEmpty){
  setState(() {
    tasksearchResult = [];
  });
}
else{
  setState(() {
    tasksearchResult = _taskdb.values.where((task){
      return task.tasktitle.toLowerCase().contains(query);
    }).toList();
  });
}
}



void searchevent(String query){
  query = query.toLowerCase();
  if(query.isEmpty){
    
  setState(() {
    eventsearchResult = [];
  });
}
else{
  
  setState(() {
    eventsearchResult = _eventdb.values.where((event){
      return event.eventname.toLowerCase().contains(query);
    }).toList();
  });
}
}

 void removefromarray(index)async{
   
  tasksearchResult.removeAt(index);
   
 }

 void taskfilterbydaterange(){
  setState(() {
    tasksearchResult = _taskdb.values.where((task) => task.date!.isAfter(start!) &&
                   task.date!.isBefore(end!) 
   ).toList();
  });
   
 }

 void eventfilterbydaterange(){
  setState(() {
    eventsearchResult = _eventdb.values.where((event) => event.date!.isAfter(start!) &&
    event.date!.isBefore(end!)
    ).toList();
    
  });
 }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        //Theme.of(context).colorScheme.primary,
      
        //floating Action button
      
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
        // key: _key,
        
      
        appBar: AppBar(
          bottom:   TabBar(
            onTap: (index){
              setState(() {
                _tabbarindex = index;
                print(_tabbarindex);
              });
            },
              
              indicatorColor: Colors.blue,
              tabs: const [
                Tab(
                  iconMargin: EdgeInsets.all(0),
                  //icon:  Icon(Icons.home),
                   child: Text('Tasks',style: TextStyle(color: Colors.white),),
                ),
                 Tab(
                   child: Text('Events',style: TextStyle(color: Colors.white),),
                )
              ]),
           



          backgroundColor: Colors.black,
          actions: [
             
             PopupMenuButton(
              
              iconColor: Colors.white,
              itemBuilder: (context)=>
              [
                const PopupMenuItem(
                  value: 1,
                  child:Text('Range Pick'),
                  ),
      
                
              ],
              onSelected: (value) async{
                if(value==1) {
                  final result = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add( const Duration(days: 365)
                    ),
                    );
                    if(result!=null){
                      setState(() {
                        start = result.start;
                        end = result.end;
                        if(_tabbarindex==0){
                          taskfilterbydaterange();
                        }
                        else{
                          eventfilterbydaterange();
                        }
                        
                      });
                    }
                }
              },
              )
          ],
            leading: GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: ((context) => const Homeview())));
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),

            

            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchcontroller,
                onChanged: (query) {
                  if(_tabbarindex==0){
                     searchTask(query);
                  }else{
                    searchevent(query);
                  }
                   
                  
                  
                },
                autofocus: true,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white,fontSize: 18),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  
                  hintText: 'Search...',
                  hintStyle: TextStyle(fontSize: 18,color: Colors.grey),
                ),
              ),
            ),
      
            ),
      
        //side menu
      
        //body
        body:  

        _tabbarindex==0 && tasksearchResult.isNotEmpty?
        AnimationLimiter(
            child: ListView.builder(
              itemCount: tasksearchResult.length,
              itemBuilder: (context , index){
                
                final task = tasksearchResult[index];
                return  
                 AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 1000),
                         child: SlideAnimation(
                          verticalOffset: 50.0,
                           child: FadeInAnimation(
                             child: Taskwidget(
                               tasktitle: task.tasktitle,
                               taskdescription: task.taskdescription,
                               date: task.date,
                               time: task.time,
                               category : task.category,
                               
                               index : index
                                
                               
                               
                             
                               
                             ),
                           ),
                         ),
                       );
              }
              ),
                
          )
         
          :

          
           
            _tabbarindex==1 && eventsearchResult.isNotEmpty ?
            

            
          AnimationLimiter(
            child: ListView.builder(
              itemCount: eventsearchResult.length,
              itemBuilder: (context , index){
                
                final task = eventsearchResult[index];
                return   AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 1000),
                         child: SlideAnimation(
                          verticalOffset: 50.0,
                           child: FadeInAnimation(
                             child: Eventwidget(
                               eventname: task.eventname,
                               eventlocation: task.eventlocation,
                               date: task.date,
                               time: task.time,
                               imagepath: task.imagepath,
                               index : index
                                
                               
                               
                             
                               
                             ),
                           ),
                         ),
                       );
              }
              ),
          ):
          
         Center(
          child: SizedBox(
              height: 200,
                width: 200,
                 child:  Image.asset('assets/notask.png'),
                  ),
        )
           
           

            
           

        // tasksearchResult.isEmpty?
        //  Center(
        //   child: SizedBox(
        //       height: 200,
        //         width: 200,
        //          child:  Image.asset('assets/notask.png'),
        //           ),
        // ):
        
        //   AnimationLimiter(
        //     child: ListView.builder(
        //       itemCount: tasksearchResult.length,
        //       itemBuilder: (context , index){
                
        //         final task = tasksearchResult[index];
        //         return   AnimationConfiguration.staggeredList(
        //                 position: index,
        //                 duration: const Duration(milliseconds: 1000),
        //                  child: SlideAnimation(
        //                   verticalOffset: 50.0,
        //                    child: FadeInAnimation(
        //                      child: Taskwidget(
        //                        tasktitle: task.tasktitle,
        //                        taskdescription: task.taskdescription,
        //                        date: task.date,
        //                        time: task.time,
        //                        category : task.category,
        //                        index : index
                                
                               
                               
                             
                               
        //                      ),
        //                    ),
        //                  ),
        //                );
        //       }
        //       ),
        //   )
      
      )
    );
  }
}
