import 'package:flutter/material.dart';

class SwitchButtonExampleFlutter extends StatefulWidget {
  const SwitchButtonExampleFlutter({super.key});

  @override
  State<SwitchButtonExampleFlutter> createState() =>
      _SwitchButtonExampleFlutterState();
}

class _SwitchButtonExampleFlutterState
    extends State<SwitchButtonExampleFlutter> {
  bool isMaterial = true;
  bool isCustomized = true;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      platform: isMaterial ? TargetPlatform.android : TargetPlatform.iOS,
      adaptations: <Adaptation<Object>>[
        if (isCustomized) const _SwitchThemeAdaptation(),
      ],
    );
    final ButtonStyle style = OutlinedButton.styleFrom(
      fixedSize: const Size(220, 40),
    );
    return Scaffold(
      appBar: AppBar(title: Text('Adaptive Switches')),
      body: Column(
        children: [
          OutlinedButton(
            style: style,
            onPressed: () {
              setState(() {
                isMaterial = !isMaterial;
              });
            },
            child:
                isMaterial
                    ? Text('Show Cupertino Style')
                    : Text('show Material Style'),
          ),
          OutlinedButton(
            style: style,
            child:
                isCustomized
                    ? Text('Remove Customisable')
                    : Text('Customisable'),
            onPressed: () {
              setState(() {
                isCustomized = !isCustomized;
              });
            },
          ),
          SwitchWithLabel(isEnabled: true, label: 'enabled'),
            SwitchWithLabel(isEnabled: false, label: 'disabled'),
        ],
      ),
    );
  }
}

class SwitchWithLabel extends StatefulWidget {
  final bool isEnabled;
  final String label;
  const SwitchWithLabel({
    super.key,
    required this.isEnabled,
    required this.label,
  });

  @override
  State<SwitchWithLabel> createState() => _SwitchWithLabelState();
}

class _SwitchWithLabelState extends State<SwitchWithLabel> {
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          padding: EdgeInsets.only(right: 20),
          child: Text(widget.label),
        ),
        Switch.adaptive(
          activeColor: Colors.blueAccent,
          value: isActive,
          onChanged:
              !widget.isEnabled
                  ? null
                  : (value) {
                    setState(() {
                      isActive = value;
                    });
                  },
        ),
      ],
    );
  }
}

class _SwitchThemeAdaptation extends Adaptation<SwitchThemeData> {
  const _SwitchThemeAdaptation();

  @override
  SwitchThemeData adapt(ThemeData theme, SwitchThemeData defaultValue) {
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return defaultValue;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return const SwitchThemeData(
          thumbColor: WidgetStateProperty<Color?>.fromMap(<WidgetState, Color>{
            WidgetState.selected: Colors.yellow,
            // Resolves to null if not selected, deferring to default values.
          }),
          trackColor: WidgetStatePropertyAll<Color>(Colors.brown),
        );
    }
  }
}
// import 'package:flutter/material.dart';
// class SwitchApp extends StatefulWidget {
//   const SwitchApp({super.key});

//   @override
//   State<SwitchApp> createState() => _SwitchAppState();
// }
// class _SwitchAppState extends State<SwitchApp> {
//   bool isMaterial = true;
//   bool isCustomized = false;

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = ThemeData(
//       platform: isMaterial ? TargetPlatform.android : TargetPlatform.iOS,
//       adaptations: <Adaptation<Object>>[
//         if (isCustomized) const _SwitchThemeAdaptation(),
//       ],
//     );
//     final ButtonStyle style = OutlinedButton.styleFrom(
//       fixedSize: const Size(220, 40),
//     );

//     return MaterialApp(
//       theme: theme,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Adaptive Switches')),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             OutlinedButton(
//               style: style,
//               onPressed: () {
//                 setState(() {
//                   isMaterial = !isMaterial;
//                 });
//               },
//               child: isMaterial
//                   ? const Text('Show cupertino style')
//                   : const Text('Show material style'),
//             ),
//             OutlinedButton(
//               style: style,
//               onPressed: () {
//                 setState(() {
//                   isCustomized = !isCustomized;
//                 });
//               },
//               child: isCustomized
//                   ? const Text('Remove customization')
//                   : const Text('Add customization'),
//             ),
//             const SizedBox(height: 20),
//             const SwitchWithLabel(label: 'enabled', enabled: true),
//             const SwitchWithLabel(label: 'disabled', enabled: false),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SwitchWithLabel extends StatefulWidget {
//   const SwitchWithLabel({
//     super.key,
//     required this.enabled,
//     required this.label,
//   });

//   final bool enabled;
//   final String label;

//   @override
//   State<SwitchWithLabel> createState() => _SwitchWithLabelState();
// }

// class _SwitchWithLabelState extends State<SwitchWithLabel> {
//   bool active = true;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           width: 150,
//           padding: const EdgeInsets.only(right: 20),
//           child: Text(widget.label),
//         ),
//         Switch.adaptive(
//           value: active,
//           onChanged: !widget.enabled
//               ? null
//               : (bool value) {
//                   setState(() {
//                     active = value;
//                   });
//                 },
//         ),
//       ],
//     );
//   }
// }

// class _SwitchThemeAdaptation extends Adaptation<SwitchThemeData> {
//   const _SwitchThemeAdaptation();

//   @override
//   SwitchThemeData adapt(ThemeData theme, SwitchThemeData defaultValue) {
//     switch (theme.platform) {
//       case TargetPlatform.android:
//       case TargetPlatform.fuchsia:
//       case TargetPlatform.linux:
//       case TargetPlatform.windows:
//         return defaultValue;
//       case TargetPlatform.iOS:
//       case TargetPlatform.macOS:
//         return const SwitchThemeData(
//           thumbColor: WidgetStateProperty<Color?>.fromMap(<WidgetState, Color>{
//             WidgetState.selected: Colors.yellow,
//             // Resolves to null if not selected, deferring to default values.
//           }),
//           trackColor: WidgetStatePropertyAll<Color>(Colors.brown),
//         );
//     }
//   }
// }



// Absolutely! Let's walk through this Flutter code **line by line**, explaining **every class, widget, and behavior** clearly — as if you’re learning Flutter from scratch.

// ---

// ## 🔶 1. Import statement

// ```dart
// import 'package:flutter/material.dart';
// ```

// This imports Flutter’s **Material Design library**, giving access to UI widgets like `MaterialApp`, `AppBar`, `Switch`, `Text`, etc.

// ---

// ## 🔶 2. Top-Level Widget: `SwitchApp`

// ```dart
// class SwitchApp extends StatefulWidget {
//   const SwitchApp({super.key});
// ```

// * This is your **main app widget**.
// * It’s a **stateful widget** because it will update the UI when you switch between iOS/Android styles or add customization.

// ```dart
//   @override
//   State<SwitchApp> createState() => _SwitchAppState();
// ```

// * Creates and connects the `State` class `_SwitchAppState` to `SwitchApp`.

// ---

// ## 🔶 3. State class `_SwitchAppState`

// ```dart
// class _SwitchAppState extends State<SwitchApp> {
//   bool isMaterial = true;
//   bool isCustomized = false;
// ```

// * `isMaterial` is a flag:
//   ✅ `true` → Android style
//   ❌ `false` → iOS style

// * `isCustomized` toggles whether to apply a custom color theme to switches.

// ---

// ## 🔶 4. Inside `build()`

// ```dart
//   @override
//   Widget build(BuildContext context) {
// ```

// Flutter calls `build()` to redraw the screen when `setState()` is used.

// ---

// ### ✳️ `ThemeData` setup:

// ```dart
// final ThemeData theme = ThemeData(
//   platform: isMaterial ? TargetPlatform.android : TargetPlatform.iOS,
// ```

// * We’re setting the platform manually.
// * If `isMaterial = true`, use Android widgets.
// * If `false`, use Cupertino (iOS) ones.

// ```dart
//   adaptations: <Adaptation<Object>>[
//     if (isCustomized) const _SwitchThemeAdaptation(),
//   ],
// );
// ```

// * `adaptations` is a **new feature in Flutter** (as of 3.22), allowing **adaptive widgets** like `Switch.adaptive()` to change look based on platform *and* theme rules.
// * Here, we only add the custom switch theme (`_SwitchThemeAdaptation`) when `isCustomized = true`.

// ---

// ### ✳️ Button style:

// ```dart
// final ButtonStyle style = OutlinedButton.styleFrom(
//   fixedSize: const Size(220, 40),
// );
// ```

// This gives both buttons the same size: 220 pixels wide and 40 high.

// ---

// ## 🧱 The Widget Tree

// ```dart
// return MaterialApp(
//   theme: theme,
// ```

// We pass in the platform-specific theme built above.

// ---

// ```dart
// home: Scaffold(
//   appBar: AppBar(title: const Text('Adaptive Switches')),
// ```

// * A basic app structure with an AppBar.

// ---

// ### 🔘 Buttons:

// ```dart
// OutlinedButton(
//   style: style,
//   onPressed: () {
//     setState(() {
//       isMaterial = !isMaterial;
//     });
//   },
// ```

// Toggles between Material and Cupertino styles.
// Calling `setState()` triggers UI rebuild.

// ```dart
// child: isMaterial
//     ? const Text('Show cupertino style')
//     : const Text('Show material style'),
// ),
// ```

// Button label updates depending on the state.

// ---

// ### 🔘 Customization toggle button:

// ```dart
// OutlinedButton(
//   style: style,
//   onPressed: () {
//     setState(() {
//       isCustomized = !isCustomized;
//     });
//   },
//   child: isCustomized
//       ? const Text('Remove customization')
//       : const Text('Add customization'),
// ),
// ```

// This toggles whether to apply custom styling to switches (yellow thumb + brown track for iOS).

// ---

// ### 🔘 Switch Widgets:

// ```dart
// const SwitchWithLabel(label: 'enabled', enabled: true),
// const SwitchWithLabel(label: 'disabled', enabled: false),
// ```

// These are two labeled switches.

// * One is active and can be toggled
// * One is disabled

// They use a custom widget class below.

// ---

// ## 🔶 Custom Widget: `SwitchWithLabel`

// ```dart
// class SwitchWithLabel extends StatefulWidget {
//   const SwitchWithLabel({
//     super.key,
//     required this.enabled,
//     required this.label,
//   });
// ```

// * Receives two values: a `label` (String) and a `enabled` (bool).
// * `enabled` decides if the switch is tappable.

// ```dart
// @override
// State<SwitchWithLabel> createState() => _SwitchWithLabelState();
// ```

// Connects to its state class.

// ---

// ### 🧠 `SwitchWithLabel` State

// ```dart
// class _SwitchWithLabelState extends State<SwitchWithLabel> {
//   bool active = true;
// ```

// * Tracks whether the switch is ON or OFF.

// ```dart
// return Row(
//   mainAxisAlignment: MainAxisAlignment.center,
// ```

// * Displays the label and switch horizontally.

// ```dart
// Container(
//   width: 150,
//   padding: const EdgeInsets.only(right: 20),
//   child: Text(widget.label),
// ),
// ```

// * Shows the label text with spacing.

// ---

// ### 🟢 The Switch itself:

// ```dart
// Switch.adaptive(
//   value: active,
//   onChanged: !widget.enabled
//       ? null
//       : (bool value) {
//           setState(() {
//             active = value;
//           });
//         },
// ),
// ```

// * `Switch.adaptive` = switch that **looks like Material or iOS**, depending on theme.
// * If `enabled = false`, the switch is disabled (`onChanged: null`).
// * Otherwise, it toggles the `active` boolean.

// ---

// ## 🎨 `_SwitchThemeAdaptation`

// This is the class that adds **custom thumb and track color** to iOS/macOS switches.

// ```dart
// class _SwitchThemeAdaptation extends Adaptation<SwitchThemeData> {
//   const _SwitchThemeAdaptation();
// ```

// * A Flutter adaptation for `SwitchThemeData`.

// ```dart
// @override
// SwitchThemeData adapt(ThemeData theme, SwitchThemeData defaultValue) {
// ```

// * This method customizes the theme *only* for Apple platforms.

// ```dart
// switch (theme.platform) {
//   ...
//   case TargetPlatform.iOS:
//   case TargetPlatform.macOS:
//     return const SwitchThemeData(
//       thumbColor: WidgetStateProperty<Color?>.fromMap(<WidgetState, Color>{
//         WidgetState.selected: Colors.yellow,
//       }),
//       trackColor: WidgetStatePropertyAll<Color>(Colors.brown),
//     );
// ```

// * When `customization = true` and the platform is iOS/macOS:

//   * Thumb is **yellow** when ON
//   * Track is always **brown**

// ---

// ## ✅ Summary

// | Concept              | Purpose                                       |
// | -------------------- | --------------------------------------------- |
// | `isMaterial`         | Toggles between Android and iOS look          |
// | `isCustomized`       | Toggles custom color adaptation               |
// | `Switch.adaptive()`  | Uses the right switch style based on platform |
// | `Adaptation`         | New way to customize adaptive widgets         |
// | `ThemeData.platform` | Manually sets platform for testing            |
// | `setState()`         | Triggers UI updates                           |
// | `OutlinedButton`     | Simple, customizable button                   |

// ---

// Would you like a **visual diagram** of the widget tree or **animations** showing the style switch behavior?
