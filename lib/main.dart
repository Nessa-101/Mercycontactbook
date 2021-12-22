import 'package:flutter/material.dart';
import 'package:mercy_contact_app/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:  Homeview(),
    );
  }
}

