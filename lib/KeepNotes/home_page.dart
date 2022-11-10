import 'package:firstapp/KeepNotes/add_task.dart';
import 'package:firstapp/KeepNotes/for_grid.dart';
import 'package:firstapp/KeepNotes/for_list.dart';
import 'package:firstapp/KeepNotes/search_data.dart';
import 'package:firstapp/KeepNotes/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 202, 147, 166),
          child: const Icon(Icons.add,color: Colors.white,),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
              return const AddTask();
            })));
          }
          ),
         backgroundColor: const Color.fromARGB(255, 202, 147, 166),
         body: Consumer<TaskData>(builder: ((context, value, child) {
           return Column(
          children: [
           Container(
            height: 180,
            color:  const Color.fromARGB(255, 202, 147, 166),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                       padding:  EdgeInsets.only(left: 30,top: 60),
                       child: Text("KeepNotes",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                     ),
                     Container(
                        padding: const EdgeInsets.only(top: 60,right: 30),
                          child: Text("${value.Notes.length} Notes",style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                  ],
                ),
                const SizedBox(height: 5,),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: IconButton(
                        iconSize: 30,
                        color: Colors.white,
                        onPressed: (){
                          showSearch(context: context, delegate: SearchData());
                        }, 
                        icon: const Icon(Icons.search)
                        ),
                    ),
                     Padding(
                       padding: const EdgeInsets.only(right: 20),
                       child: MaterialButton(
                        color: Colors.white,
                        child: Text( value.isrotate ? "List" : "Grid",style: const TextStyle(color:  Color.fromARGB(255, 202, 147, 166),fontSize: 20),),
                        onPressed: (){
                          Provider.of<TaskData>(context,listen: false).changerotate();
                        }
                        ),
                     )
                  ],
                )
              ],
            ),
           ),
          Expanded(
            child:  Container(
              height: 35,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              child: value.isrotate ? const ForList() : const ForGrid()
             )
            
          ),
          ],
         );
         }))
      );
  }
}


