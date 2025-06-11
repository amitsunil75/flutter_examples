import 'package:flutter/material.dart';

class SliverGridBuilderExample extends StatefulWidget {
  const SliverGridBuilderExample({super.key});

  @override
  State<SliverGridBuilderExample> createState() =>
      _SliverGridBuilderExampleState();
}

class _SliverGridBuilderExampleState extends State<SliverGridBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverGrid Showcase'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16.0), // Padding around the entire grid
              sliver: SliverGrid.builder(
                itemCount: 80,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0, // Vertical spacing between grid items
                  crossAxisSpacing: 10.0, // Horizontal spacing between grid items
                  childAspectRatio: 1.0, // Adjust as needed for item aspect ratio
                ),
                itemBuilder: (context, int index) {
                  return Card(
                    elevation: 4.0, // Add a shadow to the card
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Rounded corners
                    ),
                    color: index % 2 == 0 ? Colors.lightBlue[100] : Colors.lightGreen[100],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              index % 2 == 0 ? Icons.star : Icons.favorite,
                              color: index % 2 == 0 ? Colors.blueAccent : Colors.green,
                              size: 36.0,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Item $index',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: index % 2 == 0 ? Colors.blueAccent[700] : Colors.green[700],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Details for item $index',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: index % 2 == 0 ? Colors.blueAccent[400] : Colors.green[400],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
