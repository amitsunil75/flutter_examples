import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//do not 
class FocusKeyEventExample extends StatefulWidget {
  const FocusKeyEventExample({super.key});

  @override
  State<FocusKeyEventExample> createState() => _FocusKeyEventExampleState();
}

class _FocusKeyEventExampleState extends State<FocusKeyEventExample> {
  String _message = 'Press "A" while the text field is focused';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus KeyEvent Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Focus(
              onKeyEvent: (FocusNode node, KeyEvent event) {
                if (event is KeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.keyA) {
                  setState(() {
                    _message = 'You pressed A!';
                  });
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Focus me and press A',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _message,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
