import 'package:flutter/material.dart';

class RowColumnExample extends StatelessWidget {
  const RowColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
     Column(
     
      children: [
       Image.asset('assets/images/pica.jpg', height: 160,width: 190, fit: BoxFit.contain),
         
       
     ],),

     Column(children: [
          Image.asset('assets/images/pica.jpg', height: 160,width: 190, fit: BoxFit.contain),
     ],),

       Column(children: [
          Image.asset('assets/images/pica.jpg', height: 160,width: 190, fit: BoxFit.contain),
     ],),

    ],);
  }
}
