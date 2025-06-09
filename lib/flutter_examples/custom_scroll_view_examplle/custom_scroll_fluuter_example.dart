import 'package:flutter/material.dart';
// A ScrollView that creates custom scroll effects using slivers.

// A CustomScrollView lets you supply slivers directly to create various scrolling effects, such as lists, grids, and expanding headers. For example, to create a scroll view that contains an expanding app bar followed by a list and a grid, use a list of three slivers: SliverAppBar, SliverList, and SliverGrid.

// Widgets in these slivers must produce RenderSliver objects.

// To control the initial scroll offset of the scroll view, provide a controller with its ScrollController.initialScrollOffset property set.
class CustomScrollFluuterExample extends StatefulWidget {
  const CustomScrollFluuterExample({super.key});

  @override
  State<CustomScrollFluuterExample> createState() =>
      _CustomScrollFluuterExampleState();
}

class _CustomScrollFluuterExampleState
    extends State<CustomScrollFluuterExample> {
  List<int> top = <int>[];
  List<int> bottom = <int>[];
  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-key');
    return Scaffold(
      appBar: AppBar(
        title: Text('Press + to add a new item below'),
        leading: IconButton(
          onPressed: () {
            setState(() {
              top.add(-top.length - 1);
              bottom.add(bottom.length);
            });
          },
          icon: Icon(Icons.add),
        ),
      ),
      body: CustomScrollView(
        key: centerKey,
        slivers: [
          SliverList(
            
            delegate: SliverChildBuilderDelegate(
              childCount: top.length,
              (BuildContext context, int index) {
              
              return Container(
                alignment: Alignment.center,
                height: 100+top[index]%4*20.0,
                color:Colors.blue[200+top[index]%4*100],
                child:Text('Item${top[index]}')
              );
            }),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            childCount: bottom.length,
            (BuildContext context,int index){
              return Container(
                alignment: Alignment.center,
                color: Colors.blue[200+bottom[index]%4*100],
                height: 100+bottom[index]%4*20.0,
                child: Text('Item${bottom[index]}')
              );

          }))
        ],
      ),
    );
  }
}




// Sure! Let's calculate and print the **height and color values for two full cycles** — that's **8 items total** since the cycle length is 4.

// We’ll use your formulas:

// ```dart
// height = 100 + (top[index] % 4) * 20.0
// color  = Colors.blue[200 + (top[index] % 4) * 100]
// ```

// ---

// ### 🔄 Calculations for Two Cycles (index 0 to 7):

// | Index | top\[index] % 4 | Height Calculation | Height | Color Shade Calculation | Color      |
// | ----- | --------------- | ------------------ | ------ | ----------------------- | ---------- |
// | 0     | 0               | 100 + 0×20 = 100   | 100.0  | 200 + 0×100 = 200       | blue\[200] |
// | 1     | 1               | 100 + 1×20 = 120   | 120.0  | 200 + 1×100 = 300       | blue\[300] |
// | 2     | 2               | 100 + 2×20 = 140   | 140.0  | 200 + 2×100 = 400       | blue\[400] |
// | 3     | 3               | 100 + 3×20 = 160   | 160.0  | 200 + 3×100 = 500       | blue\[500] |
// | 4     | 0               | 100 + 0×20 = 100   | 100.0  | 200 + 0×100 = 200       | blue\[200] |
// | 5     | 1               | 100 + 1×20 = 120   | 120.0  | 200 + 1×100 = 300       | blue\[300] |
// | 6     | 2               | 100 + 2×20 = 140   | 140.0  | 200 + 2×100 = 400       | blue\[400] |
// | 7     | 3               | 100 + 3×20 = 160   | 160.0  | 200 + 3×100 = 500       | blue\[500] |

// ---

// ### 📋 Final Output:

// ```
// Item 0: Height = 100.0, Color = blue[200]
// Item 1: Height = 120.0, Color = blue[300]
// Item 2: Height = 140.0, Color = blue[400]
// Item 3: Height = 160.0, Color = blue[500]
// Item 4: Height = 100.0, Color = blue[200]
// Item 5: Height = 120.0, Color = blue[300]
// Item 6: Height = 140.0, Color = blue[400]
// Item 7: Height = 160.0, Color = blue[500]
// ```

// Let me know if you want this printed dynamically in Flutter's `debugPrint()` or shown directly on the screen!
