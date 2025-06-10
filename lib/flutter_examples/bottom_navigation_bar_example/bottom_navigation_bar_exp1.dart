import 'package:flutter/material.dart';

class BottomNavigationBarExp1 extends StatefulWidget {
  const BottomNavigationBarExp1({super.key});

  @override
  State<BottomNavigationBarExp1> createState() =>
      _BottomNavigationBarExp1State();
}

class _BottomNavigationBarExp1State extends State<BottomNavigationBarExp1> {
  int selectedIndex = 0;
  static const TextStyle optionTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List _options = [
    Text('index 0:Home', style: optionTextStyle),
    Text('index 1:Business', style: optionTextStyle),
    Text('index 2:School', style: optionTextStyle),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: _options.elementAt(selectedIndex),),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: [
        BottomNavigationBarItem(icon:Icon(Icons.home), label:'Home'),
        BottomNavigationBarItem(icon:Icon(Icons.business), label:'Business'),
        BottomNavigationBarItem(icon:Icon(Icons.school), label:'School'),
      ]),
    );
  }
}
