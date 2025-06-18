import 'package:flutter/material.dart';

class SnackbarFlutterExample extends StatefulWidget {
  const SnackbarFlutterExample({super.key});

  @override
  State<SnackbarFlutterExample> createState() => _SnackbarFlutterExampleState();
}

class _SnackbarFlutterExampleState extends State<SnackbarFlutterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('This is a Snackbar!'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Code to execute when the action is pressed
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ),
            );
          },
          child: const Text('Show Snackbar'),
        ),
      ),
    );
  }
}