import 'package:flutter/material.dart';

class DraggableGameExample extends StatefulWidget {
  const DraggableGameExample({super.key});

  @override
  State<DraggableGameExample> createState() => _DraggableGameExampleState();
}

class _DraggableGameExampleState extends State<DraggableGameExample> {
  int score = 0;

  final List<Map<String, dynamic>> balls = [
    {"color": Colors.red, "value": 10},
    {"color": Colors.green, "value": 20},
    {"color": Colors.blue, "value": 30},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drag the Balls!"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Draggable items (balls)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: balls.map((ball) {
              return Draggable<int>(
                data: ball["value"],
                feedback: ballWidget(ball["color"], ball["value"], isDragging: true),
                childWhenDragging: Opacity(
                  opacity: 0.3,
                  child: ballWidget(ball["color"], ball["value"]),
                ),
                child: ballWidget(ball["color"], ball["value"]),
              );
            }).toList(),
          ),

          // Drop Zone
          DragTarget<int>(
            onAcceptWithDetails: (data) {
              setState(() {
                //score += data;
              });
            },
            builder: (context, accepted, rejected) {
              return Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(4, 4),
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.inbox, color: Colors.white, size: 40),
                    const SizedBox(height: 10),
                    const Text(
                      "Drop Here",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              );
            },
          ),

          // Score display
          Card(
            elevation: 6,
            margin: const EdgeInsets.all(16),
            color: Colors.deepPurple.shade100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Text(
                "Score: $score",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ballWidget(Color color, int value, {bool isDragging = false}) {
    return Container(
      width: isDragging ? 60 : 50,
      height: isDragging ? 60 : 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: isDragging
            ? [BoxShadow(color: Colors.black26, blurRadius: 8)]
            : [],
      ),
      alignment: Alignment.center,
      child: Text(
        "$value",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
