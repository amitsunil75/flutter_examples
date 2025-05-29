import 'package:flutter/material.dart';

class PadText extends StatelessWidget {
  const PadText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.all(50),
    child: Text('Hello, Flutter! This is a text widget with padding.'),
    );
  }
}