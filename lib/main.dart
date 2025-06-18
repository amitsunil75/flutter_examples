import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/shortcuts_cut_copy_paste_example_flutter/cut_copy_paste_example_flutter.dart';
import 'package:flutter_tutorials/flutter_examples/snackbar_action_flutter_example/snackbar_flutter_example.dart';
import 'package:flutter_tutorials/flutter_examples/swipe_to_dissmiss_example/dissmissable_flutter_swipe_dissmiss.dart';
import 'package:flutter_tutorials/flutter_examples/swipe_to_dissmiss_example/swipe_to_dissmiss_example_two.dart';
import 'package:flutter_tutorials/flutter_examples/text_filed_example/focus_and_text_filed_flutter.dart';
import 'package:flutter_tutorials/flutter_examples/text_filed_example/form_key_text_filed_example.dart';
import 'package:flutter_tutorials/flutter_examples/text_filed_example/listen_to_changes_text_field.dart';
import 'package:flutter_tutorials/flutter_examples/text_filed_example/retrive_value_from_text_filed.dart';
import 'package:flutter_tutorials/flutter_examples/text_filed_example/text_filed_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return// SwitchApp();
     MaterialApp(
      title: 'Flutter tutorial',
      theme:ThemeData.dark(),
      home: CutCopyPasteExampleFlutter());
  }
}