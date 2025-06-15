import 'package:flutter/material.dart';

class DissmissableFlutterSwipeDissmissExample2 extends StatefulWidget {
  const DissmissableFlutterSwipeDissmissExample2({super.key});

  @override
  State<DissmissableFlutterSwipeDissmissExample2> createState() =>
      _DissmissableFlutterSwipeDissmissExample2State();
}

class _DissmissableFlutterSwipeDissmissExample2State
    extends State<DissmissableFlutterSwipeDissmissExample2> {
  final items = List<String>.generate(15, (i) => 'Message ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Swipe Actions"),
        centerTitle: true,
        elevation: 6,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Dismissible(
              key: Key(item),
              direction: DismissDirection.horizontal,
              background: _buildSwipeActionLeft(),
              secondaryBackground: _buildSwipeActionRight(),
              onDismissed: (direction) {
                String action = '';
                setState(() {
                  items.removeAt(index);
                  if (direction == DismissDirection.startToEnd) {
                    action = 'archived';
                  } else {
                    action = 'deleted';
                  }
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$item was $action'),
                    backgroundColor: Colors.deepPurple,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: _buildListTile(item),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSwipeActionLeft() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.green, Colors.teal],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.archive, color: Colors.white, size: 30),
          SizedBox(width: 10),
          Text("Archive", style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildSwipeActionRight() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.redAccent, Colors.deepOrange],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.delete, color: Colors.white, size: 30),
          SizedBox(width: 10),
          Text("Delete", style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildListTile(String item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.deepPurple.shade100, width: 1.5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: const CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.message, color: Colors.white),
        ),
        title: Text(item,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        subtitle: const Text("Swipe left to delete or right to archive"),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
