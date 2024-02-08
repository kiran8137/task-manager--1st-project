import 'package:flutter/material.dart';

class taskDetailview extends StatefulWidget {
  const taskDetailview({super.key});

  @override
  State<taskDetailview> createState() => _taskDetailviewState();
}

class _taskDetailviewState extends State<taskDetailview> {

 String dropdownvalue = "No Category";

 var items = ['No Category', 'Work', 'personal', 'Wishlist', 'Birthday','CREATE NEW']; //catergory list



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
           PopupMenuButton(
            iconColor: Colors.white,
           // Icon(Icons.more_vert,color: Colors.white,)
            itemBuilder: (context){
              return [
                const PopupMenuItem(
                  value: 0,
                  child:  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text("Edit"),
                    
                  ),
                  ),

                  const PopupMenuItem(
                  value: 1,
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text("Delete"),
                    
                  ),
                  ),
                  
              ];
            },
            onSelected: (value){
              if(value == 0){
                print("edit selected");
                //should navigate to the edit page
              }else if(value == 1){
                print("delete is selected");
                //should delete the task
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
                                    //_remove(index);
                                    Navigator.of(context).pop();
                                  }, 
                                  child: const Text("Ok"),
                                  ),
                              ],
                            )
                  );
              }

            },
            )
          ],
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                   DropdownButton(
                      dropdownColor: const Color.fromARGB(255, 9, 8, 79),
                      value: dropdownvalue,  // the previously selected category should be appear as initial value
                      items: items.map((items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                        
                      onChanged: (newValue) {
                        setState(() {
                          dropdownvalue = newValue!; 
                        }
                        );
                      },
                   ),

                   SizedBox(height:  MediaQuery.of(context).size.height*0.02 ),
                      
                  const Text(
                    "Task Title",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  AnimatedContainer(
                    //height: 110,
                    duration: const Duration(milliseconds: 600),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color:  Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    child: const Text("Task title",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.05,
                ),


                  const Text(
                    "Task description",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  AnimatedContainer(
                    //height: 110,
                    duration: const Duration(milliseconds: 600),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color:  Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    child: const Text("Task description",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.2),

                    const Divider(color: Colors.grey),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Due Date",style: TextStyle(color: Colors.white,fontSize: 16),),
                      Text("Date",style: TextStyle(color: Colors.white,fontSize: 16),),

                     
                    ],
                  ),

                    const Divider(color: Color.fromARGB(53, 158, 158, 158)),

                    SizedBox(height: MediaQuery.of(context).size.height*0.02),

                     const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Time",style: TextStyle(color: Colors.white,fontSize: 16),),
                      Text("Time",style: TextStyle(color: Colors.white,fontSize: 16),),

                     
                    ],
                  ),

                  const Divider(color: Color.fromARGB(53, 158, 158, 158)),

                  

                ],
              ),
            ),
            ),
      ),
    );
  }
}
