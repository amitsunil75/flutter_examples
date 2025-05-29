import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/counter_problem/counter_example.dart';
import 'package:flutter_tutorials/flutter_examples/elevated_button/elevated_button_flutter_example.dart';
import 'package:flutter_tutorials/flutter_examples/padding_examples/padtext_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
      ),
      home: CounterExample());
  }
}

