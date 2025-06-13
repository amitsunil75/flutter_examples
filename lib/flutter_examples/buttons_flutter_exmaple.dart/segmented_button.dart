// ### ✅ Flutter: `SegmentedButton` vs `ToggleButtons` — Key Differences, Use Case & Example

// ---

// ### 📌 **Definition & Difference**

// | Feature               | `ToggleButtons`                         | `SegmentedButton` (Material 3)                          |
// | --------------------- | --------------------------------------- | ------------------------------------------------------- |
// | ✅ **Selection Type**  | Single or multi-selection (manual)      | Single or multi (built-in support via `multiSelection`) |
// | 🎨 **Design**         | Material 2 look (needs manual styling)  | Material 3 native design (modern segmented look)        |
// | 🧠 **API Simplicity** | Manually track selections via bool list | Uses `ButtonSegment` with automatic state mgmt          |
// | 🧩 **Use Case**       | Toggle switches, compact filters        | Mode switches, form options, filter chips               |
// | 🚀 **Recommended**    | Legacy support or custom styling        | ✅ Preferred in modern Flutter apps (Material 3)         |

// ---

// ### ✅ **Best Use Case for `SegmentedButton`**

// * Selecting between **modes**, **themes**, **sort options**
// * Radio-style **form choices** or **category switches**

// ---

// ### 🔨 Example: `SegmentedButton` in Flutter (Material 3)

// ```dart
import 'package:flutter/material.dart';



enum Weather { cloudy, rainy, sunny }

class ButtonSegmentedExamplefluter extends StatefulWidget {
  const ButtonSegmentedExamplefluter({super.key});

  @override
  State<ButtonSegmentedExamplefluter> createState() => _ButtonSegmentedExamplefluterState();
}

class _ButtonSegmentedExamplefluterState extends State<ButtonSegmentedExamplefluter> {
  Weather _selected = Weather.sunny;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segmented Button Example"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SegmentedButton<Weather>(
              segments: const <ButtonSegment<Weather>>[
                ButtonSegment<Weather>(
                  value: Weather.cloudy,
                  icon: Icon(Icons.cloud_outlined),
                  label: Text("Cloudy"),
                ),
                ButtonSegment<Weather>(
                  value: Weather.rainy,
                  icon: Icon(Icons.beach_access),
                  label: Text("Rainy"),
                ),
                ButtonSegment<Weather>(
                  value: Weather.sunny,
                  icon: Icon(Icons.brightness_5),
                  label: Text("Sunny"),
                ),
              ],
              selected: <Weather>{_selected},
              onSelectionChanged: (Set<Weather> newSelection) {
                setState(() {
                  _selected = newSelection.first;
                });
              },
              showSelectedIcon: false,
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(color: Colors.deepPurple)),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Selected: ${_selected.name.toUpperCase()}",
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
// ```

// ---

// ### 🔍 Summary

// | When to Use                        | Widget                           |
// | ---------------------------------- | -------------------------------- |
// | Compact toggles (like checkboxes)  | `ToggleButtons`                  |
// | Stylish, clear radio-style options | ✅ `SegmentedButton` (Material 3) |

// ---

// Want to make this support multi-selection or add animations? Let me know — happy to enhance it further!
