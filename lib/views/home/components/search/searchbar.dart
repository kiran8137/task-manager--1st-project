// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:hive/hive.dart';
// import 'package:manage_your/data/functions.dart';
// import 'package:manage_your/model/task.dart';
// import 'package:manage_your/views/home/components/appbar.dart';
// import 'package:manage_your/views/home/widgets/taskwideget.dart';
// class searchbar extends StatefulWidget {
//    searchbar({super.key, 
//   // required this.query
//    //required this.isSearchvisible , required this.searchController}
// });
    
//   // final bool isSearchvisible;
//   // TextEditingController searchController;

//   @override
//   State<searchbar> createState() => _searchbarState();
// }


// class _searchbarState extends State<searchbar> {

// TextEditingController searchController = TextEditingController();

 
// final _taskdb = Hive.box<Tasks>('task_db');
// List<Tasks>searchResult = [];




// void searchTask(String query){
// query =  query.toLowerCase();
// if(query.isEmpty){
//   setState(() {
//     searchResult = [];
//   });
// }
// else{
//   setState(() {
//     searchResult = _taskdb.values.where((task){
//       return task.tasktitle.toLowerCase().contains(query);
//     }).toList();
//   });
// }
// }

// void removetask(index)async{
//    final box = await Hive.openBox<Tasks>('task_db');
//    box.deleteAt(index);
//   tasklistNotifier.value = box.values.toList();
//  }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
      
      
        
//        body: Column(
//         children: [
//           Container(
//            width: double.infinity,
//            height: 100,
//           child: Row(
//             children: [
//               SizedBox(width: 10,),
//               Icon(Icons.arrow_back,color: Colors.white,),

//               TextField(
//                 onChanged: (value){},
//                 controller: searchController,
//                   cursorColor: Colors.white,
//                   style: const TextStyle(
//                     color: Colors.white),
//                     decoration:  InputDecoration(
//                       suffixIcon: 
//                       GestureDetector(
//                         onTap: (){
//                           print('searchbar shoul gone');
//                         //   setState(() {
//                         //       searchController.clear();
//                         //   });
//                         searchController.clear();
//                         },
//                         child: Icon(Icons.cancel,
//                         color: Colors.white,
//                         ),
//                       ),
//                     ),
                    
//               )
//             ],
//           ),
//           //color: Colors.red,
//           ),
//           Divider(
            
//             // Theme.of(context).colorScheme.secondary,
//             thickness: 0.8,
//           ),


//         ],
//        )
       
//     );
    
//   }
// }

// // Visibility searchOptionbar(bool isSearchvisible , TextEditingController searchController) {
// //     return Visibility(
// //           visible: isSearchvisible,
// //           child: Padding(
// //             padding : const EdgeInsets.all(5),
// //             child: TextField(
              
// //               controller: searchController,
// //                   cursorColor: Colors.white,
// //                   style: const TextStyle(
// //                     color: Colors.white),
// //                     decoration:  InputDecoration(
// //                       suffixIcon: 
// //                       GestureDetector(
// //                         onTap: (){
// //                           print('searchbar shoul gone');
// //                         //   setState(() {
// //                         //       searchController.clear();
// //                         //   });
// //                         searchController.clear();
// //                         },
// //                         child: Icon(Icons.cancel,
// //                         color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
                    
                  
// //             ),
// //           )
// //         );
// //  }
