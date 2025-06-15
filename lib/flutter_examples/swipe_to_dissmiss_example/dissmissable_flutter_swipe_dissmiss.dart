import 'package:flutter/material.dart';

class DissmissableFlutterSwipeDissmiss extends StatefulWidget {
  const DissmissableFlutterSwipeDissmiss({super.key});

  @override
  State<DissmissableFlutterSwipeDissmiss> createState() =>
      _DissmissableFlutterSwipeDissmissState();
}

class _DissmissableFlutterSwipeDissmissState
    extends State<DissmissableFlutterSwipeDissmiss> {
  final items = List<String>.generate(20, (i) => 'Item${i + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diismissible')),
      body: ListView.builder(
        itemBuilder: (context, int index) {
          final item = items[index];
          return Dismissible(
            background: Container(color: Colors.red,),
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('${item}dissmissed')));
            },
            child: ListTile(title: Text(item)),
          );
        },
      ),
    );
  }
}
