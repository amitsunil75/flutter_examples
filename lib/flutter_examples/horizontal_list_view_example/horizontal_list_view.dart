import 'package:flutter/material.dart';

class HorizontalListViewExample extends StatefulWidget {
  const HorizontalListViewExample({super.key});

  @override
  State<HorizontalListViewExample> createState() =>
      _HorizontalListViewExampleState();
}

class _HorizontalListViewExampleState extends State<HorizontalListViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(width: 160,color: Colors.redAccent,),
        Container(width: 160,color: Colors.amber,),
         Container(width: 160,color: Colors.green,),
         Container(width: 160,color: Colors.blue,),
      ],
    ));
  }
}
