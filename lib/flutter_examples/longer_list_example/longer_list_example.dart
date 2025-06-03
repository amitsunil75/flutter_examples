import 'package:flutter/material.dart';

class LongerListExample extends StatefulWidget {
  const LongerListExample({super.key});

  @override
  State<LongerListExample> createState() => _LongerListExampleState();
}

class _LongerListExampleState extends State<LongerListExample> {
  final List<String> _items = List.generate(10000, (index) => 'Item $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 500,
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Text(_items[index], maxLines: 20, overflow: TextOverflow.ellipsis);
          },
        ),
      ),
    );
  }
}
