// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapi/data.dart';
import 'package:provider/provider.dart';

import 'page/Home.dart';
void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create:(context) => texti(),)],child: MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
      
    );
  }
}