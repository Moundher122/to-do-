import 'dart:convert';

import'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future Fetchdata()async{
  http.Response response=await http.get(Uri.parse('https://api.genderize.io/?name=moundher'));
  print(response.body);
  return jsonDecode(response.body);
}