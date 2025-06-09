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
