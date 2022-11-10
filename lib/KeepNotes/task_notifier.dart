import 'package:flutter/material.dart';


class TaskData extends ChangeNotifier{
    
  List<Note> Notes = [
    Note("Personal", "Study"),
    Note("Room", "Clean"),
    Note("for rest", "read or nap"),
    
   ];
   
   bool isrotate = false;
   
    void changerotate(){
      isrotate = !isrotate;
      notifyListeners();
    }
    void addnote(String strtitle,String strname ){
      Notes.add(Note(strtitle, strname));
      notifyListeners();
    }
    void removenote(Note note){
      Notes.remove(note);
      notifyListeners();
    }
}

class Note {
  String Title;
  String Name;
  Note(this.Title,this.Name);
}


