import 'package:flutter/material.dart';
class Evbutton extends StatelessWidget {
  const Evbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Builder(builder: (context){
        return Column(children: [
          Text('Hello World!'),
          ElevatedButton(onPressed: (){
            print('Button Pressed');
          }, child: Text('Click Me')),

        ],);
    }));
  }
}