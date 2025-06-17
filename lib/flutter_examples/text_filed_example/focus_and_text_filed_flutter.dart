import 'package:flutter/material.dart';

class FocusAndTextFiledFlutter extends StatefulWidget {
  const FocusAndTextFiledFlutter({super.key});

  @override
  State<FocusAndTextFiledFlutter> createState() =>
      _FocusAndTextFiledFlutterState();
}

class _FocusAndTextFiledFlutterState extends State<FocusAndTextFiledFlutter> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode(); // ✅ Initialize the FocusNode
  }

  @override
  void dispose() {
    myFocusNode.dispose(); // ✅ Dispose to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus and Text Field Example'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Autofocus TextField'),
            ),
            const SizedBox(height: 20),
            TextField(
              focusNode: myFocusNode,
              decoration: const InputDecoration(labelText: 'Focus Node TextField'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => myFocusNode.requestFocus(),
              icon: const Icon(Icons.edit),
              label: const Text('Focus the Second TextField'),
            ),
          ],
        ),
      ),
    );
  }
}

