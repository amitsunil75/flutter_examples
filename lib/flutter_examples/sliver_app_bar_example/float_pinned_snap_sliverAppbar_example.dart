import 'package:flutter/material.dart';

class AppBarApp extends StatefulWidget {
  const AppBarApp({super.key});

  @override
  State<AppBarApp> createState() => _AppBarAppState();
}

class _AppBarAppState extends State<AppBarApp> {
  bool _isPinned = true;
  bool _isSnapped = false;
  bool _isFloating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _isPinned,
            floating: _isFloating,
            snap: _isSnapped,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: Text('My Custom App Bar'),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Text(' sub headline: scroll to see the widget below'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 30, (
              context,
              int index,
            ) {
              return Container(
                color: index.isOdd ? Colors.blue : Colors.green,
                height: 110.0,
                child: Text('Item $index', textScaler: TextScaler.linear(5.0)),
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Pinned'),
                Switch(
                  value: _isPinned,
                  onChanged: (bool value) {
                    setState(() {
                      _isPinned = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('snapped'),
                Switch(
                  value: _isSnapped,
                  onChanged: (bool value) {
                    setState(() {
                      _isSnapped = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Floating'),
                Switch(
                  value: _isFloating,
                  onChanged: (bool value) {
                    setState(() {
                      _isFloating = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// Sure! Here's a quick, concise breakdown:

// * **Pinned**: AppBar **stays fixed** at the top when you scroll.
// * **Floating**: AppBar **slides into view** as you scroll up (even if mid-list).
// * **Snapped**: When combined with `floating`, the AppBar **snaps into full view** automatically instead of gradually appearing.

// ### Quick Combo Note:

// * `snap: true` **requires** `floating: true` to work.
// * `pinned: true` means the AppBar **never disappears** when scrolling.

// Want a visual cheat-sheet for these behaviors?
