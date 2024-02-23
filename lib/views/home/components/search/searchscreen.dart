import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive/hive.dart';
import 'package:manage_your/data/functions.dart';
import 'package:manage_your/model/task.dart';
import 'package:manage_your/views/home/homeview.dart';
import 'package:manage_your/views/home/widgets/taskwideget.dart';
import 'package:manage_your/views/taskdetail/taskdetail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}



class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchcontroller = TextEditingController();
  final _taskdb = Hive.box<Tasks>('task_db');
  List<Tasks>searchResult = [];

void searchTask(String query){
query =  query.toLowerCase();
if(query.isEmpty){
  setState(() {
    searchResult = [];
  });
}
else{
  setState(() {
    searchResult = _taskdb.values.where((task){
      return task.tasktitle.toLowerCase().contains(query);
    }).toList();
  });
}
}

 void removefromarray(index)async{
   
  searchResult.removeAt(index);
   
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      //Theme.of(context).colorScheme.primary,

      //floating Action button

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // key: _key,

      appBar: AppBar(
        backgroundColor: Colors.black,
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
          title: TextField(
            controller: searchcontroller,
            onChanged: (query) {
              searchTask(query);
            },
            autofocus: true,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white,fontSize: 18),
            decoration: const InputDecoration(
              border: InputBorder.none,
              
              hintText: 'Search...',
              hintStyle: TextStyle(fontSize: 18,color: Colors.grey),
            ),
          )),

      //side menu

      //body
      body:  
      searchResult.isEmpty?
       Center(
        child: SizedBox(
                    height: 200,
                    width: 200,
                    child:  Image.asset('assets/notask.png'),
                      ),
      ):
        AnimationLimiter(
          child: ListView.builder(
            itemCount: searchResult.length,
            itemBuilder: (context , index){
              final task = searchResult[index];
              return   AnimationConfiguration.staggeredList(
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
            }),
        )
    );
  }
}
