import 'package:flutter/material.dart';

class GestureDetectorSnackbarExample extends StatefulWidget {
  const GestureDetectorSnackbarExample({super.key});

  @override
  State<GestureDetectorSnackbarExample> createState() =>
      _GestureDetectorSnackbarExampleState();
}

class _GestureDetectorSnackbarExampleState
    extends State<GestureDetectorSnackbarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('SnackBar Example')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            const message = SnackBar(content: Text('You pressed me !!'));
            ScaffoldMessenger.of(context).showSnackBar(message);
          },
          child: Container(
            width: 100,
            height: 60,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
        
            child: Center(child: Text('Press Me!!')),
          ),
        ),
      ),
    );
  }
}
