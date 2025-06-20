import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/focus_widget_example_flutter/bank_example_from_json.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return// SwitchApp();
     MaterialApp(
      title: 'Flutter tutorial',
      theme:ThemeData.dark(),
      home: const BankJsonApp());
  }
}