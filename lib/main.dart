import 'package:firstapp/KeepNotes/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'KeepNotes/home_page.dart';
  

void main() { 
  runApp( const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return ChangeNotifierProvider(
        create: (context) => TaskData(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),   
          ),
        );
  }
}


  