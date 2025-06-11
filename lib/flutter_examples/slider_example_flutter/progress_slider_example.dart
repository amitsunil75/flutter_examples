import 'package:flutter/material.dart';

class ProgressSliderScreen extends StatefulWidget {
  const ProgressSliderScreen({super.key});

  @override
  State<ProgressSliderScreen> createState() => _ProgressSliderScreenState();
}

class _ProgressSliderScreenState extends State<ProgressSliderScreen> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Slider'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Slide to Fill',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Progress bar container
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: MediaQuery.of(context).size.width * (_value / 100),
                  height: 30,
                  decoration: BoxDecoration(
                    color: _value == 100 ? Colors.green : Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      '${_value.toInt()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 40),

            // Slider
            Slider.adaptive(
              value: _value,
              min: 0,
              max: 100,
              divisions: 100,
              label: '${_value.toInt()}%',
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
