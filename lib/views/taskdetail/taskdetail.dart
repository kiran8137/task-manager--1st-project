import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manage_your/data/functions.dart';
import 'package:manage_your/model/task.dart';
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/views/home/homeview.dart';

class TaskDetailView extends StatefulWidget {
  const TaskDetailView({super.key, 
  required this.task,
  required this.index,

  });

final Tasks task;
final int index;
  // final String? tasktitle;
  // final String? taskdescription;
  // final DateTime? duedate;

  @override
  State<TaskDetailView> createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends State<TaskDetailView> {
   TextEditingController? titlecontroller;
   TextEditingController? descriptioncontroller;

  String? recieveddate;
  DateTime? newPickedDate;

  String? recievedtime;
  TimeOfDay? newPickedTime;

String? formattedTime;


  @override
  void initState() {
     
 titlecontroller = TextEditingController(text: widget.task.tasktitle);
descriptioncontroller = TextEditingController(text: widget.task.taskdescription);
//dropdownvalue = widget.task.category;
  recieveddate = DateFormat('dd-MM-yyyy').format(widget.task.date!);
  recievedtime = widget.task.time;
  //"${widget.task.time?.hourOfPeriod}:${widget.task.time?.minute}";


    super.initState();
  }

// TextEditingController titlecontroller = TextEditingController(text: widget.task.tasktitle);
// TextEditingController _descriptioncontroller = TextEditingController();


 String? dropdownvalue ="No Category";

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

      floatingActionButton: 
      Visibility(
        visible: iseditSelected,
        child:  GestureDetector(
      onTap: (){
        
        updateTask(titleController: titlecontroller , descriptionController: descriptioncontroller , index: widget.index , category: dropdownvalue ,date : newPickedDate ?? widget.task.date, time: formattedTime ?? recievedtime  );
        Navigator.of(context).pop();
        setState(() {
          iseditSelected = !iseditSelected;
        });
      },
      child: Container(
        
           //width: 600,
          width: MediaQuery.sizeOf(context).width * 50 / 100,
          height: 40,
          decoration: BoxDecoration(
             
            borderRadius: BorderRadius.circular(10),
            color: Appcolors.buttonColor,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
             
             
            ],
          ),
          ),
    ),
        ),
     
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  iseditSelected?

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
                   ):
                   Text(widget.task.category!,
                   style: const TextStyle(color: Colors.white,fontSize: 17.5),
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

                  const SizedBox(height: 5,),

                    const Divider(color: Color.fromARGB(153, 158, 158, 158)),

                    const SizedBox(height: 10,),

                    GestureDetector(
                     
                      onTap:  
                         
                         ()async{
                          print("click worked well");
                          
                        if(iseditSelected){
                          newPickedDate = await showDatePicker(
                            
                            context: context,
                            initialDate: widget.task.date,
                            firstDate: DateTime(2000), 
                            lastDate: DateTime(2100),
                            );
                        }
                          // NewPickedDate = await showDatePicker(
                            
                          //   context: context,
                          //   initialDate: DateTime.now(),
                          //   firstDate: DateTime(2000), 
                          //   lastDate: DateTime(2100),
                          //   );
                            // setState(() {
                            //   datecontroller.text = DateTime.now().toString();
                            // });
                           // DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)
                            if(newPickedDate!=null){
                              setState(() {

                                 recieveddate = DateFormat('dd/MM/yyyy').format(newPickedDate!);

                              });
                            }
                            // setState(() {
                            //   _datecontroller.text = DateTime.now().toString();
                            // });
                        },
                      
                      child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Due Date",style: TextStyle(color: Colors.white,fontSize: 16),),

                        
                        const SizedBox(width: 196,),
                        
                        Container(
                          height: 30,
                          width: 100,
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                             color: const Color.fromARGB(255, 48, 47, 47),
                          ),
                         
                          child: Center(
                            child: Text(recieveddate!,
                              //DateFormat('dd-MM-yyyy').format(widget.task.date!),
                            style: const TextStyle(color: Colors.white,fontSize: 16),))),
                      
                       
                      ],
                      ),
                    ),

                    const Divider(color: Color.fromARGB(53, 158, 158, 158)),

                    SizedBox(height: MediaQuery.of(context).size.height*0.04),

                      GestureDetector(
                        onTap:  ()async{

                          if(iseditSelected){
                             newPickedTime= await showTimePicker(
                            context: context,
                             initialTime: TimeOfDay.now()
                             );
                        //      if(pickedtime!=null){

                        //   //  DateTime combinedDateTime = DateTime(
                        //   //     pickeddate!.day,
                        //   //     pickeddate!.month,
                        //   //     pickeddate!.year,
                        //   //     pickedtime!.minute,
                        //   //     pickedtime!.hour,
                              

                        //   //   );
                             
                             
                        //      // print(pickedtime!.format(context),
                              DateTime parsedTime = DateFormat.jm().parse(newPickedTime!.format(context).toString());
                              
                               // print(parsedTime);
        
                                formattedTime = DateFormat('h:mm a').format(parsedTime!);
                                print(formattedTime);
                              
                              if(newPickedTime!=null){
                                setState(() {
                                  recievedtime = formattedTime;
                                });
                              }
                              // setState(() {
                                
                              //    recievedtime = formattedTime;
                              // });
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                       const  Text("Time",style: TextStyle(color: Colors.white,fontSize: 16),),
                                             
                         Container(
                        
                         height: 30,
                          width: 100,
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                             color: const Color.fromARGB(255, 48, 47, 47),
                          ),
                         child: Center(
                           child: Text( 
                            
                            
                            recievedtime!=null?
                             recievedtime!:'No' ,
                        
                            style: const TextStyle(color: Colors.white,fontSize: 16)
                            ),
                         ),
                         )
                                             // Text("Time",style: TextStyle(color: Colors.white,fontSize: 16),),
                        
                                             
                                            ],
                                          ),
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