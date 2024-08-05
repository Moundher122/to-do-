// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var h=Fetchdata();
    print(h);
    
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
    );
  }
}