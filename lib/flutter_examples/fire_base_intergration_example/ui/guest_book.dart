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

class GuestBook extends StatefulWidget {
  const GuestBook({
    super.key,
    required this.addMessage,
    required this.messages,
  });
  final FutureOr<void> Function(String message) addMessage;
  final List<GuestBookMessage> messages;

  @override
  State<GuestBook> createState() => _GuestBookState();
}

class _GuestBookState extends State<GuestBook> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.all(14),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                SizedBox(
                  width: 800,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    expands: false,
                    
                    selectionHeightStyle: BoxHeightStyle.tight,
                    controller: _controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Invalid input';
                      }
                      return null;
                    },
                    decoration:InputDecoration(
                      //constraints: BoxConstraints(minWidth: 20,maxWidth: 40,minHeight: 40,maxHeight: 50),
                      contentPadding: EdgeInsetsGeometry.only(left: 22,right:20),
                      filled: true,
                      isCollapsed: false,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      fillColor: Colors.black,
                      focusColor: Colors.black,
                      hoverColor:  Colors.black,
                      labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      labelText: 'Send Message',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20)
                     ) 
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                StyledButton(
                  child: Row(
                    children: [
                      Icon(Icons.send),
                      SizedBox(width: 4),
                      Text('SEND'),
                    ],
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await widget.addMessage(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
               
              ],
            ),
          ),
        ),
         SizedBox(height: 10),
                for (var message in widget.messages)
                  Paragraph(
                    'Name :${message.name},Message:${message.message} ',
                  ),
                SizedBox(height: 10),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
