import 'package:flutter/material.dart';


class DrwarerNaviagtionExampleFlutter extends StatefulWidget {
  const DrwarerNaviagtionExampleFlutter({super.key});

  @override
  State<DrwarerNaviagtionExampleFlutter> createState() =>
      _DrwarerNaviagtionExampleFlutterState();
}

class _DrwarerNaviagtionExampleFlutterState extends State<DrwarerNaviagtionExampleFlutter> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Center(child: Text('🏠 Home Screen', style: TextStyle(fontSize: 24))),
    const Center(child: Text('🔍 Search Screen', style: TextStyle(fontSize: 24))),
    const Center(child: Text('⛵ Sailing Screen', style: TextStyle(fontSize: 24))),
  ];

  void _onDestinationSelected(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    Navigator.of(context).pop(); // Close drawer
  }

  void _navigateToProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Drawer Navigation'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _navigateToProfile,
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Hello, User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Tap the profile to view',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            buildAnimatedTile(Icons.home, 'Home', 0),
            buildAnimatedTile(Icons.search, 'Search', 1),
            buildAnimatedTile(Icons.sailing, 'Sailing', 2),
          ],
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          final slide = Tween<Offset>(
            begin: const Offset(0.1, 0),
            end: Offset.zero,
          ).animate(animation);

          return SlideTransition(
            position: slide,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: _screens[_selectedIndex],
      ),
    );
  }

  Widget buildAnimatedTile(IconData icon, String title, int index) {
    final isSelected = _selectedIndex == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: isSelected ? Colors.blue.shade100 : Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.blueAccent : Colors.black54),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blueAccent : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () => _onDestinationSelected(index),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          '👤 Profile Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
