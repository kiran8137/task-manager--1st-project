import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manage_your/data/functions.dart';
import 'package:manage_your/model/task.dart';
import 'package:manage_your/views/home/homeview.dart';

class taskDetailview extends StatefulWidget {
  const taskDetailview({super.key, 
  required this.task,
  required this.index,

  });

final Tasks task;
final int index;
  // final String? tasktitle;
  // final String? taskdescription;
  // final DateTime? duedate;

  @override
  State<taskDetailview> createState() => _taskDetailviewState();
}

class _taskDetailviewState extends State<taskDetailview> {
   TextEditingController? titlecontroller;
   TextEditingController? descriptioncontroller;

   
  @override
  void initState() {
    // TODO: implement initState
 titlecontroller = TextEditingController(text: widget.task.tasktitle);
descriptioncontroller = TextEditingController(text: widget.task.taskdescription);
dropdownvalue = widget.task.category;


    super.initState();
  }

// TextEditingController titlecontroller = TextEditingController(text: widget.task.tasktitle);
// TextEditingController _descriptioncontroller = TextEditingController();


 String? dropdownvalue = "No Category";

 var items = ['No Category', 'Work', 'personal', 'Wishlist', 'Birthday','CREATE NEW']; //catergory list

late bool iseditSelected = false;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
       resizeToAvoidBottomInset: false,
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
                setState(() {
                  iseditSelected = !iseditSelected;
                });
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
                                    remove(widget.index);
                                    Navigator.of(context).pop();
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Homeview() ));
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
                      //color:  Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    child: iseditSelected?
                    TextFormField(
                      controller: titlecontroller,
                       style: const TextStyle(color: Colors.white),
                    ):
                     Text(widget.task.tasktitle,
                    style: const TextStyle(fontSize: 20,color: Colors.grey),),
                  ),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.04,
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
                     // color:  Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    child: iseditSelected?
                    TextFormField(
                      controller: descriptioncontroller,
                      style: const TextStyle(color: Colors.white),
                    ):
                    Text(widget.task.taskdescription,
                    style: const TextStyle(fontSize: 20,color: Colors.white),),
                  ),

                  SizedBox(height: 5,),

                    const Divider(color: Color.fromARGB(153, 158, 158, 158)),

                    SizedBox(height: 10,),

                   const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Due Date",style: TextStyle(color: Colors.white,fontSize: 16),),
                      //Text(DateFormat('dd-MM-yyyy').format(widget.task.date!),style: TextStyle(color: Colors.white,fontSize: 16),),

                     
                    ],
                  ),

                    const Divider(color: Color.fromARGB(53, 158, 158, 158)),

                    SizedBox(height: MediaQuery.of(context).size.height*0.04),

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
