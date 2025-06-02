import 'package:flutter/material.dart';

class ListViewProblem extends StatelessWidget {
  const ListViewProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
         Image.asset('assets/images/pica.jpg', height: 260,width: 190, fit: BoxFit.contain),
          Image.asset('assets/images/pica.jpg', height: 260,width: 190, fit: BoxFit.contain),
           Image.asset('assets/images/pica.jpg', height: 260,width: 190, fit: BoxFit.contain),
    ],);
  }
}
