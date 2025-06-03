import 'package:flutter/material.dart';

class StackProblemExample extends StatefulWidget {
  const StackProblemExample({super.key});

  @override
  State<StackProblemExample> createState() => _StackProblemExampleState();
}

class _StackProblemExampleState extends State<StackProblemExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Stack(
            clipBehavior: Clip.antiAlias,
            fit: StackFit.passthrough,
            children: [
              Container(
                color: Colors.red,
                height: 600,
                width: 500,
              ),
              Positioned(
                top: 200,
                left:200,
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  width: 200,
                ),
              ),
            ],
          ),
          Text('This is a stack problem example'),

      ],),),
    );
  }
}
