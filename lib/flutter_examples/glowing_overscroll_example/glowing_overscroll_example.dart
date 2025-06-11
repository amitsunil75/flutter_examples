import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GlowingOverscrollIndicatorExampleApp extends StatelessWidget {
  const GlowingOverscrollIndicatorExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GlowingOverscrollIndicator Sample')),
      body: const GlowingOverscrollIndicatorExample(),
    );
  }
}

const Set<PointerDeviceKind> allPointers = <PointerDeviceKind>{
  ...PointerDeviceKind.values,
};

// Passing this class into the MaterialApp constructor ensures that a
// GlowingOverscrollIndicator is created, regardless of the target platform.
class AlwaysGlow extends MaterialScrollBehavior {
  const AlwaysGlow();

  @override
  Set<PointerDeviceKind> get dragDevices => allPointers;

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return GlowingOverscrollIndicator(
      axisDirection: details.direction,
      color: Colors.amberAccent,
      child: child,
    );
  }
}

class GlowingOverscrollIndicatorExample extends StatelessWidget {
  const GlowingOverscrollIndicatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    final double leadingPaintOffset =
        MediaQuery.paddingOf(context).top + kToolbarHeight;

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification notification) {
        if (notification.leading) {
          notification.paintOffset = leadingPaintOffset;
        }
        return false;
      },
      child: const CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(title: Text('Custom PaintOffset')),
          SliverToBoxAdapter(
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              child: ColoredBox(
                color: Colors.grey,
                child: SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Center(child: Text('Glow all day!')),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Icon(Icons.sunny, color: Colors.amberAccent, size: 128),
          ),
        ],
      ),
    );
  }
}
