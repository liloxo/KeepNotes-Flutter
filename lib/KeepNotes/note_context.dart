import 'package:flutter/material.dart';


class NoteContext extends StatelessWidget {
    final String newtexttitle;
    final String newtextname;
    const NoteContext(this.newtexttitle,this.newtextname, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 202, 147, 166),
        ),
      backgroundColor:  Colors.white,
      body: ListView(
          children: [ 
              Container(
                height: 70,
                width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 202, 147, 166),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)
                    )
                  ),
                child: SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: Padding(
                              padding: const EdgeInsets.only(bottom: 30,right: 15,left: 15),
                              child: Text(newtexttitle,style: const TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white,),overflow: TextOverflow.ellipsis,softWrap: false,),
                            ),
                        ),
              ),
              Wrap(
                   children: [
                      Container(
                      padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                      color: Colors.white,
                      child: Text(newtextname,style: const TextStyle(color: Color.fromARGB(255, 134, 37, 69) ,fontSize: 20)),       
                      ),
                   ]
              )  
          ],
        )
    );
  }
}