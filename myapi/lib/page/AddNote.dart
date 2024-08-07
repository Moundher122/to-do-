// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:myapi/data.dart';

class AddNote extends StatelessWidget {
   AddNote({super.key});
  final bodycon=TextEditingController();
  final titlecon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(20)),
              width: 300,
              height: 50,
              child: Center(
                child: TextField(
                  controller: titlecon,
                  decoration: InputDecoration(border: InputBorder.none,hintText: 'Title'),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: bodycon,
               maxLines: 5,decoration: InputDecoration(
              hintText: 'task',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  GestureDetector(
                    onTap: () async {
                      await addnote(titlecon.text, bodycon.text);
                      if (context.mounted) {
                        Navigator.pop(context,true);
                      }
                      titlecon.clear();
                      bodycon.clear();
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      color: Colors.deepPurple,
                      child: Center(child: Text('Save'),),
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context,false);
                      titlecon.clear();
                      bodycon.clear();
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      color: Colors.deepPurple,
                      child: Center(child: Text('Cancel'),),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}