import 'package:flutter/material.dart';

class RetriveValueFromTextFiled extends StatefulWidget {
  const RetriveValueFromTextFiled({super.key});

  @override
  State<RetriveValueFromTextFiled> createState() =>
      _RetriveValueFromTextFiledState();
}

class _RetriveValueFromTextFiledState extends State<RetriveValueFromTextFiled> {
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'show name',
        child: Center(child: Text('press me')),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  'Your name is: ${_nameController.text}',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
          );
        },
      ),
      appBar: AppBar(title: Text('Retrive value from Text filed')),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your name',
            ),
          ),
        ],
      ),
    );
  }
}
