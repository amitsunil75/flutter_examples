import 'package:flutter/material.dart';


class FocusWidgetExample extends StatelessWidget {
  const FocusWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Focus Widget Example Flutter')),
      body: MyCustomWidgetExampleFlutter(),
    );
  }
}

class MyCustomWidgetExampleFlutter extends StatefulWidget {
  const MyCustomWidgetExampleFlutter({super.key});

  @override
  State<MyCustomWidgetExampleFlutter> createState() =>
      _MyCustomWidgetExampleFlutterState();
}

class _MyCustomWidgetExampleFlutterState
    extends State<MyCustomWidgetExampleFlutter> {
  final FocusNode _focusNode = FocusNode();
  Color _color = Colors.red;
  String _focusStatus = 'Unfocused';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          _color = Colors.green;
          _focusStatus = 'Focused';
        } else {
          _color = Colors.red;
          _focusStatus = 'Unfocused';
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Focus(
            focusNode: _focusNode,
            child: Container(
              width: 300,
              height: 50,
              alignment: Alignment.center,
              color: _color,
              child: Text(
                _focusStatus,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _focusNode.requestFocus();
            },
            child: const Text('Give Focus'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _focusNode.unfocus();
            },
            child: const Text('Remove Focus'),
          ),
        ],
      ),
    );
  }
}
