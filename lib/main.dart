import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/swipe_to_dissmiss_example/dissmissable_flutter_swipe_dissmiss.dart';
import 'package:flutter_tutorials/flutter_examples/swipe_to_dissmiss_example/swipe_to_dissmiss_example_two.dart';

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
      home:     DissmissableFlutterSwipeDissmissExample2());
  }
}