import 'package:flutter/material.dart';

class AppBarTabsExampleFlutter extends StatelessWidget {
  const AppBarTabsExampleFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( // ✅ Wrap with DefaultTabController
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('Premium Tabs Example'),
          backgroundColor: Colors.deepPurple,
          elevation: 4,
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            tabs: [
              Tab(icon: Icon(Icons.cloud_outlined), text: 'Cloud'),
              Tab(icon: Icon(Icons.beach_access), text: 'Beach'),
              Tab(icon: Icon(Icons.brightness_5), text: 'Sunny'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TabScreen(icon: Icons.cloud_outlined, label: "Cloud Screen", color: Colors.blueAccent),
            TabScreen(icon: Icons.beach_access, label: "Beach Screen", color: Colors.teal),
            TabScreen(icon: Icons.brightness_5, label: "Sunny Screen", color: Colors.orange),
          ],
        ),
      ),
    );
  }
}

class TabScreen extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const TabScreen({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: color.withOpacity(0.1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: color),
            const SizedBox(height: 20),
            Text(
              label,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
