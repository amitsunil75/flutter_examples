import 'package:flutter/material.dart';

class InkwellFlutterExmaple extends StatefulWidget {
  const InkwellFlutterExmaple({super.key});

  @override
  State<InkwellFlutterExmaple> createState() => _InkwellFlutterExmapleState();
}

class _InkwellFlutterExmapleState extends State<InkwellFlutterExmaple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body:Center(
        child: InkWell(
          onTap: ()=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('this is inkwell huree!!'))),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
             color: Colors.blueAccent,
             borderRadius: BorderRadius.circular(12),
            ),
           
            child: Center(child: Text('Press Me!!!')),
          ),
        ),
      )
    );
  }
}
