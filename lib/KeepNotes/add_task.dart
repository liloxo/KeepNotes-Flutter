import 'package:firstapp/KeepNotes/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final GlobalKey<FormState> forkey = GlobalKey<FormState>();

  String? newtexttitle;
  String? newtextname;
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body:  Form(
        key: forkey,
         child: ListView(
                children: [
                  const SizedBox(height: 25,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: IconButton(iconSize: 30, onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back),color: const Color.fromARGB(255, 158, 80, 106),),
                      ),
                    ],
                  ),
                  const Padding(
                    padding:  EdgeInsets.only(left: 10,top: 25),
                    child: Text(" Add Note ", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 158, 80, 106)),),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.only(right: 20,left: 20),
                    child: TextFormField(
                      maxLines: 1,
                      maxLength: 36,
                      validator: (value){
                        if( value == null || value.isEmpty ) {
                            return "Title Can't Be Empty";
                        }return null ;
                      },
                      
                    onSaved:(val){
                       newtexttitle = val;
                     },
                     decoration: const InputDecoration(
                      hintText: "Write Title",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 202, 147, 166)
                        )
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 202, 147, 166)
                        )
                      )
                     ),
                     cursorColor: const Color.fromARGB(255, 202, 147, 166),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.only(right: 20,left: 20),
                    child: TextFormField(
                      validator: (value){
                        if( value == null || value.isEmpty ) {
                            return "Note Can't Be Empty";
                        }return null ;
                      },
                      maxLines: null, 
                     onSaved:(val){
                       newtextname = val;
                     },
                     decoration:   const InputDecoration(
                      hintText: "Write Note",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 202, 147, 166)
                        )
                      ),
                      enabledBorder: UnderlineInputBorder(                
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 202, 147, 166)
                        )
                      )
                     ),
                     cursorColor: const Color.fromARGB(255, 202, 147, 166),
                    ),
                  ),        
                  const SizedBox(height: 50,),
                  Center(
                    child: MaterialButton(
                          color: Colors.white,
                          onPressed: () {
                           if(forkey.currentState!.validate()) {
                              forkey.currentState!.save();
                              Provider.of<TaskData>(context,listen: false).addnote(newtexttitle!,newtextname!);
                              Navigator.pop(context);
                           }  
                          }, 
                          child: const Text("Add",style:  TextStyle(color: Color.fromARGB(255, 134, 37, 69) ,fontSize: 20),)
                        ),
                  ),
                ],
          ),
      ),
    );
  }
}