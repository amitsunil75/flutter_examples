// import 'package:flutter/material.dart';

// class ScrollbarExmple extends StatefulWidget {
//   const ScrollbarExmple({super.key});

//   @override
//   State<ScrollbarExmple> createState() => _ScrollbarExmpleState();
// }

// class _ScrollbarExmpleState extends State<ScrollbarExmple> {
//   final ScrollController _scrollController = ScrollController();
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Scrollbar(
//         thickness: 4,
//         controller: _scrollController,
//         thumbVisibility: true,
//         scrollbarOrientation: ScrollbarOrientation.left,
//         child: ListView(
//           children: [for (int i = 0; i < 50; i++) Text('Item$i')],
//         ),
//       ),
//     );
//   }
// }

//can use for listview 

import 'package:flutter/material.dart';

class ScrollbarExmple extends StatefulWidget {
  const ScrollbarExmple({super.key});

  @override
  State<ScrollbarExmple> createState() => _ScrollbarExmpleState();
}

class _ScrollbarExmpleState extends State<ScrollbarExmple> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose(); // Avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        thickness: 4,
        scrollbarOrientation: ScrollbarOrientation.left,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 50,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Item $index'),
          ),
        ),
      ),
    );
  }
}
