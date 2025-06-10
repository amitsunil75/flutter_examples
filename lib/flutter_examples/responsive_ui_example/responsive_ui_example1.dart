import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ResponsiveScreenExample extends StatefulWidget {
  const ResponsiveScreenExample({super.key});

  @override
  State<ResponsiveScreenExample> createState() => _ResponsiveScreenExampleState();
}

class _ResponsiveScreenExampleState extends State<ResponsiveScreenExample> with WidgetsBindingObserver {
  ui.FlutterView? _view;
  bool isLargeScreen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // To listen for size changes
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _view = View.maybeOf(context); // Get the current FlutterView (screen)
    _checkScreenSize();
  }

  @override
  void didChangeMetrics() {
    // Called when screen size changes (rotation, resize, etc.)
    _checkScreenSize();
  }

  void _checkScreenSize() {
    final screenWidth = _view?.physicalSize.width ?? 0;
    final pixelRatio = _view?.devicePixelRatio ?? 1.0;
    final logicalWidth = screenWidth / pixelRatio;

    setState(() {
      isLargeScreen = logicalWidth > 600; // Arbitrary breakpoint for "large"
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Example")),
      body: isLargeScreen
          ? Row(
              children: [
                NavigationRail(
                  selectedIndex: 0,
                  onDestinationSelected: (_) {},
                  destinations: const [
                    NavigationRailDestination(icon: Icon(Icons.home), label: Text("Home")),
                    NavigationRailDestination(icon: Icon(Icons.settings), label: Text("Settings")),
                  ],
                ),
                const VerticalDivider(),
                const Expanded(child: Center(child: Text("Large Screen Content"))),
              ],
            )
          : const Center(child: Text("Mobile Layout")),
      bottomNavigationBar: isLargeScreen
          ? null
          : BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
              ],
            ),
    );
  }
}
