import 'package:flutter/material.dart';

class RcolExample extends StatelessWidget {
  const RcolExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/images/pica.jpg', fit: BoxFit.cover));
  }
}