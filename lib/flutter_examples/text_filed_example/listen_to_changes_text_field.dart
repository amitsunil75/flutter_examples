import 'package:flutter/material.dart';

class ListenToChangesTextField extends StatefulWidget {
  const ListenToChangesTextField({super.key});

  @override
  State<ListenToChangesTextField> createState() =>
      _ListenToChangesTextFieldState();
}

class _ListenToChangesTextFieldState extends State<ListenToChangesTextField> {
  final TextEditingController _textController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _textController.addListener(printListner);
    super.initState();
  }

  void printListner(){
    final text=_textController.text;
    if(text.length<10){
      print('Text is less than 10 characters: $text');
    }else{
      print('Text is 10 characters or more: $text');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listen to change in text filed')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your phone number',
            ),
            onChanged: (value) {
              print('Text changed to: ${value.length}');
            },
          ),
          ElevatedButton(onPressed: () {}, child: Text('submit')),
        ],
      ),
    );
  }
}
