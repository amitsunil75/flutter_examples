// The `ToggleButtons` widget is ideal when you want users to **select one or more options from a group**, like a filter, setting toggle, or mode selector. It’s compact, visual, and customizable.

// ---

// ### 🎯 **Best Use Cases:**

// * **Weather mode selection**
// * **Map layer toggles**
// * **Font/style toggles (bold, italic, underline)**
// * **Filters (e.g., All / Active / Completed)**

// ---

// ### ✅ Example: Weather Selection UI with `ToggleButtons` + `enum`

// Here’s a polished, real-world example of using `ToggleButtons` to select the current weather type, mapped to your `enum Weather`.

// ```dart
import 'package:flutter/material.dart';



enum Weather { cloudy, rainy, sunny }

class ToggleButtonsWeatherExample extends StatefulWidget {
  const ToggleButtonsWeatherExample({super.key});

  @override
  State<ToggleButtonsWeatherExample> createState() => _ToggleButtonsWeatherExampleState();
}

class _ToggleButtonsWeatherExampleState extends State<ToggleButtonsWeatherExample> {
  Weather _selectedWeather = Weather.rainy;

  final List<Weather> _weatherOptions = Weather.values;

  List<bool> get _selections => _weatherOptions.map((w) => w == _selectedWeather).toList();

  void _onPressed(int index) {
    setState(() {
      _selectedWeather = _weatherOptions[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final icons = <Icon>[
      const Icon(Icons.cloud_outlined),
      const Icon(Icons.beach_access_sharp),
      const Icon(Icons.brightness_5_sharp),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Toggle'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              borderRadius: BorderRadius.circular(12),
              selectedColor: Colors.white,
              fillColor: Colors.deepPurple,
              color: Colors.deepPurple,
              isSelected: _selections,
              onPressed: _onPressed,
              children: icons,
            ),
            const SizedBox(height: 30),
            Text(
              'Selected: ${_selectedWeather.name.toUpperCase()}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
// ```

// ---

// ### 🧠 Highlights:

// | Feature                    | Purpose                                |
// | -------------------------- | -------------------------------------- |
// | `enum Weather`             | Clean, semantic state handling         |
// | `ToggleButtons`            | Compact icon toggle                    |
// | `List<bool>` state mapping | Syncs enum with UI toggle logic        |
// | Custom colors + styling    | Makes it polished and production-ready |

// ---

// Let me know if you want:

// * Multi-selection toggle (e.g., allow multiple weathers)
// * Tooltip on hover
// * Adaptive layout (row or column)
// * Dark mode version

// I'll help you scale it up for your project UI!
