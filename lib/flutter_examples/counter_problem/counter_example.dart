import 'package:flutter/material.dart';
class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int _counter=0;
  void incrementCounter(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text("Current Counter:$_counter"),
             ElevatedButton(onPressed: ()=>incrementCounter(), child: Text('Increment Counter')),
            ],
          ),
        ),
      ),
    );
  }
}