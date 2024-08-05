// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import'package:http/http.dart' as http;

Future  fetchdata()async{
  http.Response response= await http.get(Uri.parse('http://192.168.8.120:8000/'));
   List k=[];
   var items=jsonDecode(response.body);
   for(var item in items){
    k.add(item);
   }
   return k;
}
class texti extends ChangeNotifier{
   List st=[];

  void gettitle()async{
    st=await fetchdata();
    notifyListeners();
  }
}

Future addnote(String title,String body) async{
  await http.post(
    Uri.parse('http://192.168.8.120:8000/create/'),
    headers:{
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'title':title,
      'body':body
    }),
  );
}
Future updatnote(int m,String t,b)async{
  await http.put(
    Uri.parse('http://192.168.8.120:8000/${m.toString()}/update/'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(
      {
        'title':t,
        'body':b
      }
    )
  );
}
Future deletenot(int m)async{
  await http.delete(
    Uri.parse(
      'http://192.168.8.120:8000/${m.toString()}/delete'
    ),headers: {
      'Content-Type': 'application/json',
    }
  );
}