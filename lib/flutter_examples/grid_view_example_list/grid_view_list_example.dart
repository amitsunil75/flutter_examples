import 'package:flutter/material.dart';

class GridViewListExample extends StatefulWidget {
  const GridViewListExample({super.key});

  @override
  State<GridViewListExample> createState() => _GridViewListExampleState();
}

class _GridViewListExampleState extends State<GridViewListExample> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 9/ 2, // w
      addRepaintBoundaries: true,
      padding: EdgeInsetsDirectional.all(10),
      shrinkWrap: true,
    children: List.generate(50,(index){
      return Card(      
        child: Center(child: Text('Item $index')),
      );
    }),
    );
  }
}
