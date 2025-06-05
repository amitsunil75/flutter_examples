import 'package:flutter/material.dart';

class ListWheelScrollviewExample extends StatefulWidget {
  const ListWheelScrollviewExample({super.key});

  @override
  State<ListWheelScrollviewExample> createState() =>
      _ListWheelScrollviewExampleState();
}

class _ListWheelScrollviewExampleState
    extends State<ListWheelScrollviewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView(
        diameterRatio: 0.5,
        //offAxisFraction: -0.5,
        useMagnifier: true,
        magnification: 1.5,
        itemExtent: 80, children:List.generate(20, (index)=>Container(width:300,height: 80,color: Colors.amberAccent,child: Center(child: Text('Box$index')),))),
    );
  }
}
