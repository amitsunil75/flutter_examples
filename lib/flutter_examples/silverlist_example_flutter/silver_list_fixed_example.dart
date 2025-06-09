import 'package:flutter/material.dart';

class SilverListFixedExample extends StatefulWidget {
  const SilverListFixedExample({super.key});

  @override
  State<SilverListFixedExample> createState() => _SilverListFixedExampleState();
}

class _SilverListFixedExampleState extends State<SilverListFixedExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (BuildContext context, int index) {
              return Container(alignment: Alignment.center, color: Colors.blue[100 * (index % 9)], child: Text('Item $index'));
            }),
          ),
        ],
      ),
    );
  }
}
// In Flutter, both `SliverList` and `SliverFixedExtentList` are types of **slivers**—scrollable areas used in `CustomScrollView`. However, they differ in **how they size and render** their children:

// ---

// ### 🔹 `SliverList`

// * **Flexible height** items.
// * Accepts a `delegate` that builds each child widget **with dynamic height**.
// * Each item can have a **different height**.

// **Use Case**: When you have list items of varying heights.

// ```dart
// SliverList(
//   delegate: SliverChildBuilderDelegate(
//     (context, index) => Container(
//       height: 100.0 + (index % 5) * 20.0,
//       color: Colors.teal[100 * ((index % 9) + 1)],
//     ),
//     childCount: 20,
//   ),
// )
// ```

// ---

// ### 🔹 `SliverFixedExtentList`

// * **Fixed height** items.
// * You must specify an exact `itemExtent` (e.g., `100.0`), and **all items will be that height**.
// * More **efficient** because Flutter can calculate how many widgets to build without measuring.

// **Use Case**: When all list items have the **same height** and you want better performance.

// ```dart
// SliverFixedExtentList(
//   itemExtent: 100.0,
//   delegate: SliverChildBuilderDelegate(
//     (context, index) => Container(
//       color: Colors.amber[100 * ((index % 9) + 1)],
//     ),
//     childCount: 20,
//   ),
// )
// ```

// ---

// ### ⚖️ Summary Comparison:

// | Feature            | `SliverList`             | `SliverFixedExtentList`       |
// | ------------------ | ------------------------ | ----------------------------- |
// | Child Height       | Varies per item          | Fixed for all items           |
// | Layout Performance | Slightly slower          | Faster due to known height    |
// | Use When           | Variable-height children | All children have same height |

// Let me know if you want a live example combining both in one `CustomScrollView`.
