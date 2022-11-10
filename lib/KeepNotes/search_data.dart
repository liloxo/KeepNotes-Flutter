import 'package:firstapp/KeepNotes/note_context.dart';
import 'package:firstapp/KeepNotes/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchData extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){query = "";}, icon: const Icon(Icons.close),color: const Color.fromARGB(255, 158, 80, 106),)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){close(context, null);}, icon: const Icon(Icons.arrow_back),color: const Color.fromARGB(255, 158, 80, 106),);
  }

  @override
    
  Widget buildResults(BuildContext context) {
         return const Text("");
  }

  @override
  
  Widget buildSuggestions(BuildContext context) {
    List querylist = Provider.of<TaskData>(context).Notes.where((element) => element.Title.contains(query)).toList();
    
    return Consumer<TaskData>(builder: (context, value, child) {
      return ListView.builder(
        itemCount: query == "" ? value.Notes.length : querylist.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              query = query == "" ? value.Notes[index].Title : querylist[index].Title;
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NoteContext(querylist[index].Title,querylist[index].Name)));
                    },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: query == "" ? Text(value.Notes[index].Title,style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 158, 80, 106),fontWeight: FontWeight.bold),) 
                : Text("${querylist[index].Title}",style: const TextStyle(fontSize: 25,color: Color.fromARGB(255, 158, 80, 106),fontWeight: FontWeight.bold))
                ),
          );
        }
        );
    });
  }

}