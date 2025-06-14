import 'package:flutter/material.dart';

// Draggable<T extends Object> class
// A widget that can be dragged from to a DragTarget.

// When a draggable widget recognizes the start of a drag gesture, it displays a feedback widget that tracks the user's finger across the screen. If the user lifts their finger while on top of a DragTarget, that target is given the opportunity to accept the data carried by the draggable.

// The ignoringFeedbackPointer defaults to true, which means that the feedback widget ignores the pointer during hit testing. Similarly, ignoringFeedbackSemantics defaults to true, and the feedback also ignores semantics when building the semantics tree.

// On multitouch devices, multiple drags can occur simultaneously because there can be multiple pointers in contact with the device at once. To limit the number of simultaneous drags, use the maxSimultaneousDrags property. The default is to allow an unlimited number of simultaneous drags.

// This widget displays child when zero drags are under way. If childWhenDragging is non-null, this widget instead displays childWhenDragging when one or more drags are underway. Otherwise, this widget always displays child.

//port 'package:flutter/material.dart';

class DraggableFlutterExample extends StatefulWidget {
  const DraggableFlutterExample({super.key});

  @override
  State<DraggableFlutterExample> createState() =>
      _DraggableFlutterExampleState();
}

class _DraggableFlutterExampleState extends State<DraggableFlutterExample> {
  int acceptableData = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Example')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Draggable<int>(
              data: 10,
              childWhenDragging: Container(
                height: 100,
                width: 100,
                color: Colors.purpleAccent,
                alignment: Alignment.center,
                child: const Text('Dragging...'),
              ),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: const Text('Draggable'),
              ),
              feedback: Material( // Use Material for proper rendering of feedback
                color: Colors.transparent,
                child: Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  color: Colors.redAccent,
                  child: const Icon(Icons.directions_bike, color: Colors.white),
                ),
              ),
            ),
            DragTarget<int>(
              onAccept: (data) {
                setState(() {
                  acceptableData += data;
                });
              },
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                  height: 100,
                  width: 150, // Increased width
                  padding: const EdgeInsets.all(8),
                  color: Colors.cyanAccent,
                  alignment: Alignment.center,
                  child: Text(
                    'Value: $acceptableData',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
