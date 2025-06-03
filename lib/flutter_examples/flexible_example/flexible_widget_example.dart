import 'package:flutter/material.dart';

class FlexibleWidgetExample extends StatelessWidget {
  const FlexibleWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [

      Flexible(
        flex: 2,
        child: Container(
        color: Colors.amber,
      )),
       Flexible(
        flex: 3,
        child: Container(
        color: Colors.blue,
      )),
       Flexible(
        flex: 2,
        child: Container(
        color: Colors.greenAccent,
      )),

      ],));
  }
}
