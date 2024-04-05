// import 'package:flutter/material.dart';
// //import 'package:manage_your/views/tasks/Addtask.dart';
// //import 'package:manage_your/views/tasks/Addtask.dart';
// import 'package:manage_your/views/tasks/taskview.dart';

// class Fab extends StatelessWidget {
//   const Fab({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//        // displaybottomsheet(context);
//        Navigator.push(context,MaterialPageRoute(builder: (context) => const Addtaskview()));
//        // print("fab tapped");

//        //Navigator.pop(context, MaterialPageRoute(builder: (context)=> const addtask()));
//       },
//       child: Container(
        
//            //width: 600,
//           width: MediaQuery.sizeOf(context).width * 60 / 100,
//           height: 45,
//           decoration: BoxDecoration(
             
//             borderRadius: BorderRadius.circular(10),
//             color: const Color.fromARGB(255, 55, 105, 204),
//           ),
//           child: const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Add New Text",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Icon(
//                 Icons.add,
//                 size: 20,
//                 color: Colors.white,
//               )
//             ],
//           ),
//           ),
//     );
//   }
// }