import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/listview_problem/listviewbuilderproblem.dart';
import 'package:flutter_tutorials/flutter_examples/listview_problem/listviewproblem.dart';

class LayoutBuilderProblem extends StatefulWidget {
  const LayoutBuilderProblem({super.key});

  @override
  State<LayoutBuilderProblem> createState() => _LayoutBuilderProblemState();
}

class _LayoutBuilderProblemState extends State<LayoutBuilderProblem> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 500) {
          return Listviewbuilderproblem();
        } else {
          return ListViewProblem();
        }
      },
    );
  }
}
