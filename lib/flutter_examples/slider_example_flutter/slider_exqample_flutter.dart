import 'package:flutter/material.dart';

class AdaptiveSliderScreen extends StatefulWidget {
  const AdaptiveSliderScreen({super.key});

  @override
  State<AdaptiveSliderScreen> createState() => _AdaptiveSliderScreenState();
}

class _AdaptiveSliderScreenState extends State<AdaptiveSliderScreen> {
  double _value = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Slider'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Volume Control',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '${_value.toInt()}%',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Slider.adaptive(
                  min: 0,
                  max: 100,
                  divisions: 20,
                  value: _value,
                  label: '${_value.toInt()}%',
                  onChanged: (double newValue) {
                    setState(() {
                      _value = newValue;
                    });
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Slide to adjust the volume. This slider adapts to your platform!',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
