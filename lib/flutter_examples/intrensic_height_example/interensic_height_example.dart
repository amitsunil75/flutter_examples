import 'package:flutter/material.dart';

class InterensicHeightExample extends StatelessWidget {
  const InterensicHeightExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [

      IntrinsicHeight(
        child: Row(
        //  mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,

          children: [
          Stack(children: [
             Container(
            height: 200,
            width: 299,
            decoration: BoxDecoration(color: Colors.blue),
        
          ),
           Positioned.fill(child: Center(child: Text('hi',style: TextStyle(),textAlign: TextAlign.center,))),
          ],)
         
         
        ],),
      )

    ]));
  }
}
