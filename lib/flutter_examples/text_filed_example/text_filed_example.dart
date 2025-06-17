import 'package:flutter/material.dart';

class MyCreativeTextFiled extends StatefulWidget {
  const MyCreativeTextFiled({super.key});

  @override
  State<MyCreativeTextFiled> createState() => _MyCreativeTextFiledState();
}

class _MyCreativeTextFiledState extends State<MyCreativeTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20,vertical: 10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'enter your name'
            ),
          ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'enter your email',
            ),
          )
        ],
      )
    );
  }
}
