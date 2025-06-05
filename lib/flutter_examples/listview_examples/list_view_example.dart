import 'package:flutter/material.dart';

class ListvieweXampleFlutter extends StatefulWidget {
  const ListvieweXampleFlutter({super.key});

  @override
  State<ListvieweXampleFlutter> createState() => _ListvieweXampleFlutterState();
}

class _ListvieweXampleFlutterState extends State<ListvieweXampleFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        addAutomaticKeepAlives: true,
        cacheExtent: 20,
        addRepaintBoundaries: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children:List.generate(20, (index)=>Row(
          children: [
            Container(width: 80,height:80 ,color: Colors.blueAccent,child: Center(child: Text('Box  $index'),),),
             const SizedBox(width: 12), // Space between ite
          ],
        ))
      )
    );
  }
}
