import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/services/models/guest_book_message.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/widgets/my_widgets.dart';
// In Dart, both `Future` and `FutureOr` are used for handling asynchronous operations, but they serve different purposes:

// ---

// ### 🔁 **`Future<T>`**

// A `Future<T>` **always represents a value that will be available later**—asynchronously.

// #### ✅ Used When:

// * You **know** the result will be computed asynchronously.
// * You want to use `await` or `.then()`.

// #### 📦 Example:

// ```dart
// Future<String> fetchData() async {
//   await Future.delayed(Duration(seconds: 1));
//   return 'Data fetched';
// }
// ```

// ---

// ### 🔁 **`FutureOr<T>`**

// A `FutureOr<T>` is a type that represents:

// * A **value of type `T`** *(synchronously)* **or**
// * A **`Future<T>`** *(asynchronously)*

// #### ✅ Used When:

// * A function **might return** either a value **immediately** or **later**.
// * You want to write code that handles both sync and async return types.

// #### 📦 Example:

// ```dart
// FutureOr<String> maybeFetchData(bool async) {
//   if (async) {
//     return Future.delayed(Duration(seconds: 1), () => 'Async data');
//   } else {
//     return 'Sync data';
//   }
// }
// ```

// ---

// ### 🧠 Summary Table

// | Feature          | `Future<T>`       | `FutureOr<T>`                    |
// | ---------------- | ----------------- | -------------------------------- |
// | Return type      | Asynchronous only | Sync **or** async                |
// | Awaitable        | ✅ Yes             | ✅ Only if it's a `Future`        |
// | Flexibility      | ❌ Only async      | ✅ Handles both                   |
// | Typical use case | APIs, async logic | Wrappers, middle layers, options |

// ---

// ### ✅ When to Use Each

// | Use Case                                                | Type to Use   |
// | ------------------------------------------------------- | ------------- |
// | You're always returning asynchronously (e.g. API calls) | `Future<T>`   |
// | You might return a value immediately or later           | `FutureOr<T>` |

// ---

// Would you like a Flutter-specific example to illustrate both?

// A stateful widget to manage the guestbook input and display
class GuestBook extends StatefulWidget {
  const GuestBook({
    super.key,
    required this.addMessage, // Function to add a message
    required this.messages,   // List of existing messages
  });

  final FutureOr<void> Function(String message) addMessage; // Callback to add message to backend
  final List<GuestBookMessage> messages; // Messages to show

  @override
  State<GuestBook> createState() => _GuestBookState(); // Creates associated state object
}

class _GuestBookState extends State<GuestBook> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState'); // Used to validate form
  final TextEditingController _controller = TextEditingController();    // Controls text input

  @override
  Widget build(BuildContext context) {
    return Column( // Main vertical layout
      crossAxisAlignment: CrossAxisAlignment.start, // Align items to the left
      children: [
        Padding( // Add space around form
          padding: EdgeInsetsGeometry.all(14),
          child: Form( // Wraps input in a form for validation
            key: _formKey,
            child: Row( // Horizontal layout for text field + button
              children: [
                SizedBox( // Fixed width input field
                  width: 800,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Input text style
                    expands: false,
                    selectionHeightStyle: BoxHeightStyle.tight,
                    controller: _controller, // Connects controller to field
                    validator: (value) { // Checks if input is empty
                      if (value == null || value.isEmpty) {
                        return 'Invalid input';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsetsGeometry.only(left: 22, right: 20), // Inner spacing
                      filled: true,
                      fillColor: Colors.black,
                      focusColor: Colors.black,
                      hoverColor: Colors.black,
                      isCollapsed: false,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      labelText: 'Send Message', // Placeholder text
                      border: OutlineInputBorder( // Rounded border
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Space between input and button
                StyledButton( // Custom send button
                  child: Row(
                    children: [
                      Icon(Icons.send),
                      SizedBox(width: 4),
                      Text('SEND'),
                    ],
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await widget.addMessage(_controller.text); // Call parent method
                      _controller.clear(); // Clear input
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10), // Space before messages

        // Display messages from list
        for (var message in widget.messages)
          Paragraph(
            'Name :${message.name}, Message: ${message.message}',
          ),

        SizedBox(height: 10),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller when widget is destroyed
    super.dispose();
  }
}
// 🧠 What Widgets Do (in short)
// Widget	Purpose
// StatefulWidget	Widget that can rebuild when its state changes.
// TextEditingController	Controls and clears the input text.
// Form + TextFormField	Input field with validation.
// GlobalKey<FormState>	Used to validate the form.
// StyledButton	Custom-styled button (likely your own or imported).
// Column / Row	Layout widgets for vertical and horizontal alignment.
// SizedBox	Adds fixed spacing or dimensions.
// Paragraph	Custom widget to show messages (likely wraps Text).