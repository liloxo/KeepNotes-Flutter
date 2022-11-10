import 'package:firstapp/KeepNotes/note_context.dart';
import 'package:firstapp/KeepNotes/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ForList extends StatefulWidget {
  const ForList({Key? key}) : super(key: key);

  @override
  State<ForList> createState() => _ForListState();
}

class _ForListState extends State<ForList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder:(context, value, child) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20),
                  child: ListView.separated(
                  separatorBuilder: (context, index) { 
                     return const SizedBox(height: 20,);
                   },
                  itemCount: value.Notes.length,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                              child: Text(value.Notes[index].Title,style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),softWrap: false),
                            ),
                             Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(value.Notes[index].Name,style: const TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.w300),softWrap: false),
                                ),   
                              ListTile(
                                trailing: IconButton(
                                  onPressed: (){
                                    Provider.of<TaskData>(context,listen: false).removenote(value.Notes[index]);
                                  }, 
                                  icon: const Icon(Icons.remove,color: Colors.white,size: 40,)),
                              )
                          ],
                        ),
                      ),
                    );
                  },         
                  ),
                );
              } );
  }
}