import 'package:flutter/material.dart';

class FilledButtonDemo extends StatelessWidget {
  const FilledButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
             Column(children: [
              SizedBox(height: 30,),
              Text('Filled'),
              FilledButton(onPressed: (){}, child: Text('Enabled')),
              SizedBox(height: 30,),
              FilledButton(onPressed: (){}, child:Text('Disabled')),

             ],),
              SizedBox(height: 30,),
                   Column(children: [
              SizedBox(height: 30,),
              Text('Filled'),
              FilledButton.tonal(onPressed: (){}, child: Text('Enabled')),
              SizedBox(height: 30,),
              FilledButton.tonal(onPressed: (){}, child:Text('Disabled')),

             ],),
          ],
        ),
      )
    );
  }
}
