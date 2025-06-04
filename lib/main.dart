import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/counter_problem/counter_example.dart';
import 'package:flutter_tutorials/flutter_examples/elevated_button/elevated_button_flutter_example.dart';
import 'package:flutter_tutorials/flutter_examples/flexible_example/flexible_widget_example.dart';
import 'package:flutter_tutorials/flutter_examples/grid_view_example_list/grid_view_list_example.dart';
import 'package:flutter_tutorials/flutter_examples/horizontal_list_view_example/horizontal_list_view.dart';
import 'package:flutter_tutorials/flutter_examples/intrensic_height_example/interensic_height_example.dart';
import 'package:flutter_tutorials/flutter_examples/layoutbuilder_problem/layout_builder_problem.dart';
import 'package:flutter_tutorials/flutter_examples/listview_problem/listviewbuilderproblem.dart';
import 'package:flutter_tutorials/flutter_examples/listview_problem/listviewproblem.dart';
import 'package:flutter_tutorials/flutter_examples/longer_list_example/longer_list_example.dart';
import 'package:flutter_tutorials/flutter_examples/over_lay_portal_example/overlayportalexample.dart';
import 'package:flutter_tutorials/flutter_examples/padding_examples/padtext_example.dart';
import 'package:flutter_tutorials/flutter_examples/row_column_spacing_example/rcol_example.dart';
import 'package:flutter_tutorials/flutter_examples/rows_alignment/expanded_expample.dart';
import 'package:flutter_tutorials/flutter_examples/rows_alignment/row_alignment.dart';
import 'package:flutter_tutorials/flutter_examples/rows_alignment/row_column.dart';
import 'package:flutter_tutorials/flutter_examples/stack_problem_example/stack_problem_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter tutorial',
      theme: ThemeData(
     
      ),
      home:   GridViewListExample());
  }
}

