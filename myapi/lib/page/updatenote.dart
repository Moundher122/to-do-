// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:myapi/data.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class updatenote extends StatefulWidget {
  int  st;
   updatenote({super.key,required this.st});

  @override
  State<updatenote> createState() => _updatenoteState();
}
class _updatenoteState extends State<updatenote> {
  TextEditingController mycon=TextEditingController();
  TextEditingController youcon=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     mycon=TextEditingController(text:context.read<texti>().st[widget.st]['title']);
     youcon=TextEditingController( text:context.read<texti>().st[widget.st]['body']);
  }
   Future<bool>  onWillPop()async{
    final shouldpop=await showDialog<bool>(context: context,
     builder:(context) {
       return AlertDialog(
        content: SizedBox(
          height: 100,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('your chnage doesnt save'),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   GestureDetector(
                    onTap: () {
                      int s=context.read<texti>().st[widget.st]['id'] ;
                      updatnote(s, mycon.text, youcon.text);
                      Navigator.pop(context,true);
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      color: Colors.deepPurple,
                      child: Center(child: Text('Save'),),
                    ),
                  ),
                  SizedBox(width: 20,),
                   GestureDetector(
                    onTap: () {
                      Navigator.pop(context,false);
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      color: Colors.deepPurple,
                      child: Center(child: Text('Cancel'),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
       );
     },);
    return  shouldpop?? false;
   }

   
  
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          int s=context.read<texti>().st[widget.st]['id'] ;
          updatnote(s, mycon.text, youcon.text);
          Navigator.pop(context,true);
        },
        child: Icon(Icons.save),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title:',style: TextStyle(fontSize: 24,),),
              TextField(
                maxLines: 1,
                controller: mycon,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              ),
              SizedBox(height: 10,),
              Text('Task',style: TextStyle(fontSize: 24,),),
              TextField(
                maxLines: 5,
                controller: youcon,
               decoration: InputDecoration(
                border: InputBorder.none,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}