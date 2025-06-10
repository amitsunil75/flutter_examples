import 'package:flutter/material.dart';

class SliverGridExampleFlutter extends StatefulWidget {
  const SliverGridExampleFlutter({super.key});

  @override
  State<SliverGridExampleFlutter> createState() =>
      _SliverGridExampleFlutterState();
}

class _SliverGridExampleFlutterState extends State<SliverGridExampleFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Colors.teal[100 * ((index % 9) + 1)],
                  alignment: Alignment.center,
                  child: Text('Item $index'),
                );
              },
              childCount: 20,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              mainAxisExtent: 200.0, // OR use childAspectRatio
            ),
          ),
        ],
      ),
    );
  }
}


// ### 🧩 `SliverGrid.count` vs `SliverGrid.extent` vs `SliverGrid.builder` — Key Differences

// | Widget               | Key Use                                | Columns / Width Defined By  |
// | -------------------- | -------------------------------------- | --------------------------- |
// | `SliverGrid.count`   | Fixed number of columns                | `crossAxisCount`            |
// | `SliverGrid.extent`  | Max width per item (auto column count) | `maxCrossAxisExtent`        |
// | `SliverGrid.builder` | Lazily builds items for performance    | Use with count/extent logic |

// **In short**:

// * `count`: Use when you know how many columns you want.
// * `extent`: Use when you know how wide each item should be.
// * `builder`: Use for large or dynamic item lists.

// Let me know if you want a visual or responsive grid example!
