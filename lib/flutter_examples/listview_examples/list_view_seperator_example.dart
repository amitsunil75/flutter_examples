import 'package:flutter/material.dart';

class ListViewSeperatorExample extends StatefulWidget {
  const ListViewSeperatorExample({super.key});

  @override
  State<ListViewSeperatorExample> createState() =>
      _ListViewSeperatorExampleState();
}

class _ListViewSeperatorExampleState extends State<ListViewSeperatorExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) => Text('Box $index'),
        separatorBuilder: (_, _) => Divider(),
        itemCount: 50,
      ),
    );
  }
}
