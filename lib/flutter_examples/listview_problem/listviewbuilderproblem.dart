import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/listview_problem/list_example.dart';

class Listviewbuilderproblem extends StatefulWidget {
  const Listviewbuilderproblem({super.key});

  @override
  State<Listviewbuilderproblem> createState() => _ListviewbuilderproblemState();
}

class _ListviewbuilderproblemState extends State<Listviewbuilderproblem> {
  final List items = tasks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index].toString()),
          onTap: () {
            // Here you would normally navigate to a new screen or perform an action
          },
        );
      }),
    );
  }
}
