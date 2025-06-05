import 'package:flutter/material.dart';

class DraggableScrollableSheetExqample extends StatefulWidget {
  const DraggableScrollableSheetExqample({super.key});

  @override
  State<DraggableScrollableSheetExqample> createState() =>
      _DraggableScrollableSheetExqampleState();
}

class _DraggableScrollableSheetExqampleState
    extends State<DraggableScrollableSheetExqample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 0.6,
      builder: (context,controller){
      return  SingleChildScrollView(
        controller: controller,
        child:Image.asset('assets/images/pica.jpg', fit: BoxFit.contain) ,
      );
    }));
  }
}
