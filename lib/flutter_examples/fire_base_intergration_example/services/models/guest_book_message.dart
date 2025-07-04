// This line imports the Flutter Material library.
// It provides access to prebuilt widgets (like Text, Scaffold, etc.) and design tools.
import 'package:flutter/material.dart';

// This is a Dart class named 'GuestBookMessage'.
// A class is a blueprint to create objects (instances) that can hold and manage data.
class GuestBookMessage {
  // These are two 'final' variables: 'name' and 'message'.
  // 'final' means once these variables are assigned, their value cannot be changed.
  // This makes the class immutable (good for data models).
  final String name;     // The name of the person who posted the message
  final String message;  // The message text itself

  // This is the **constructor** of the class.
  // A constructor is a special function that is used to create and initialize an object.
  // The 'required' keyword ensures that both 'message' and 'name' must be provided when creating an instance.
  GuestBookMessage({required this.message, required this.name});
}
