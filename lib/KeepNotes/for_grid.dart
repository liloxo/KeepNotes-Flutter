import 'package:firstapp/KeepNotes/note_context.dart';
import 'package:firstapp/KeepNotes/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ForGrid extends StatefulWidget {
  const ForGrid({Key? key}) : super(key: key);

  @override
  State<ForGrid> createState() => _ForGridState();
}

class _ForGridState extends State<ForGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder:(context, value, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 15,left: 15),
                 child: GridView.builder(
                  itemCount: value.Notes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20,mainAxisSpacing: 20), 
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NoteContext(value.Notes[index].Title,value.Notes[index].Name)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 202, 147, 166),
                                borderRadius: BorderRadius.circular(30)
                              ),
                        child: ListView(
                          children: [ 
                              Container(
                                    padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                                    child: Text(value.Notes[index].Title,style: const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),overflow: TextOverflow.ellipsis),
                                  ),
                              Container(      
                                    padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                                    child: Text(value.Notes[index].Name,style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis),
                                  ),
                              Container(
                                  padding: const EdgeInsets.only(top: 35),
                                  child: ListTile(
                                    trailing: IconButton(
                                      onPressed: (){
                                        Provider.of<TaskData>(context,listen: false).removenote(value.Notes[index]);
                                      }, 
                                      icon: const Icon(Icons.remove,color: Colors.white,size: 40,)),
                                  ),
                                ),              
                          ],
                        ),
                      ),
                    );
                  }
                  ),
                );
              } );
  }
}