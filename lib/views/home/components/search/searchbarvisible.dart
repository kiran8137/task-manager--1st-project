import 'package:flutter/material.dart';
import 'package:manage_your/views/home/components/search/searchbar.dart';

// Visibility searchOptionbar(bool isSearchvisible , TextEditingController searchController) {
//     return Visibility(
//           visible: isSearchvisible,
//           child: Padding(
//             padding : const EdgeInsets.all(5),
//             child: TextField(
//               onChanged: (query){
//                 searchbar(query : query);
                
//               },
//               controller: searchController,
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
                    
                  
//             ),
//           )
//         );
//  }