import 'package:flutter/material.dart';

class SliverProtypeList extends StatefulWidget {
  const SliverProtypeList({super.key});

  @override
  State<SliverProtypeList> createState() =>
      _SliverProtypeListState();
}

class _SliverProtypeListState extends State<SliverProtypeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SliverPrototypeExtentList Example')),
      body: CustomScrollView(
        slivers: [
          // PrototypeExtentList means every item will take the height of this Container
          SliverPrototypeExtentList(
            prototypeItem: Container(
              height: 100, // This defines the fixed height for all items
              alignment: Alignment.center,
              child: const Text('Prototype'),
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[100 * ((index % 9) + 1)],
                  child: Text(
                    'Item $index',
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}



// ### 🧾 Why `SliverPrototypeExtentList` is used:

// * It **fixes the height of all list items** using a **prototype widget**, instead of specifying a number.
// * Useful when you want to **reuse an actual widget** to define height instead of hardcoding.

// ---

// ### 📌 When to Use (`SliverPrototypeExtentList`):

// ✅ Use it when:

// * All list items have the **same height**.
// * You want to **define that height visually** using a sample widget.
// * You prefer layout control through a widget instead of numbers (e.g., matching card styles or designs).

// ---

// ### 🆚 Compared To:

// | Widget                      | How height is set           | Use When                                |
// | --------------------------- | --------------------------- | --------------------------------------- |
// | `SliverFixedExtentList`     | Hardcoded `itemExtent`      | All items same fixed height             |
// | `SliverPrototypeExtentList` | Height from `prototypeItem` | All items same, but want visual control |
// | `SliverList`                | Varying heights             | Items have different heights            |

// Let me know if you want a decision chart to choose between them!
