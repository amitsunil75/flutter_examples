import 'package:flutter/material.dart';

class SpacedItemList extends StatefulWidget {
  const SpacedItemList({super.key});

  @override
  State<SpacedItemList> createState() => _SpacedItemListState();
}

class _SpacedItemListState extends State<SpacedItemList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.minHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(20, (index)=>ItemList(text: 'Item$index'))
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(child: SizedBox(height: 100, child: Center(child: Text(text))));
  }
}
