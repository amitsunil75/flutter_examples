import 'package:flutter/material.dart';

class SliverGridCountExample extends StatefulWidget {
  const SliverGridCountExample({super.key});

  @override
  State<SliverGridCountExample> createState() =>
      _SliverGridCountExampleState();
}

class _SliverGridCountExampleState extends State<SliverGridCountExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light background for contrast
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0), // outer padding
            sliver: SliverGrid.count(
              crossAxisCount: 3, // Better spacing with 3 columns
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: List.generate(
                50,
                (index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Box $index',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
