import 'dart:collection';

import 'package:flutter/material.dart';
typedef ColorEntry = DropdownMenuEntry<ColorLabel>;

// DropdownMenuEntry labels and values for the first dropdown menu.
enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;

  static final List<ColorEntry> entries = UnmodifiableListView<ColorEntry>(
    values.map<ColorEntry>(
      (ColorLabel color) => ColorEntry(
        value: color,
        label: color.label,
        enabled: color.label != 'Grey',
        style: MenuItemButton.styleFrom(foregroundColor: color.color),
      ),
    ),
  );
}

typedef IconEntry = DropdownMenuEntry<IconLabel>;

// DropdownMenuEntry labels and values for the second dropdown menu.
enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud('Cloud', Icons.cloud_outlined),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;

  static final List<IconEntry> entries = UnmodifiableListView<IconEntry>(
    values.map<IconEntry>(
      (IconLabel icon) => IconEntry(value: icon, label: icon.label, leadingIcon: Icon(icon.icon)),
    ),
  );
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  ColorLabel? selectedColor;
  IconLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DropdownMenu<ColorLabel>(
                        initialSelection: ColorLabel.green,
                        controller: colorController,
                        // The default requestFocusOnTap value depends on the platform.
                        // On mobile, it defaults to false, and on desktop, it defaults to true.
                        // Setting this to true will trigger a focus request on the text field, and
                        // the virtual keyboard will appear afterward.
                        requestFocusOnTap: true,
                        label: const Text('Color'),
                        onSelected: (ColorLabel? color) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        dropdownMenuEntries: ColorLabel.entries,
                      ),
                      const SizedBox(width: 24),
                      DropdownMenu<IconLabel>(
                        controller: iconController,
                        enableFilter: true,
                        requestFocusOnTap: true,
                        leadingIcon: const Icon(Icons.search),
                        label: const Text('Icon'),
                        inputDecorationTheme: const InputDecorationTheme(
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        onSelected: (IconLabel? icon) {
                          setState(() {
                            selectedIcon = icon;
                          });
                        },
                        dropdownMenuEntries: IconLabel.entries,
                      ),
                    ],
                  ),
                ),
              ),
              if (selectedColor != null && selectedIcon != null)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('You selected a ${selectedColor?.label} ${selectedIcon?.label}'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(selectedIcon?.icon, color: selectedColor?.color),
                      ),
                    ],
                  ),
                )
              else
                const Text('Please select a color and an icon.'),
            ],
          ),
        ),
      ),
    );
  }
}



// Certainly! Here's a **comprehensive list of Flutter concepts, widgets, classes, and features** used in your code, with **clear definitions** for each one — no code, just **definitions and purpose**.

// ---

// ## 🔷 Dart & Core Flutter Concepts

// ### `enum`

// A special data type that allows you to define a set of named constant values.

// > Used to model fixed categories like `ColorLabel` and `IconLabel`.

// ### `typedef`

// A way to create a custom name for a function or object type.

// > Example: `typedef ColorEntry = DropdownMenuEntry<ColorLabel>;`

// ### `UnmodifiableListView<T>`

// A read-only (immutable) wrapper around a list.

// > Once created, you **cannot add/remove items**, preventing unintended changes.

// ---

// ## 🧱 Flutter Widgets

// ### `MaterialApp`

// Top-level widget for Material Design apps.

// > Sets global theme, routes, localization, etc.

// ### `Scaffold`

// Provides the **basic visual structure** of a Material Design screen.

// > Includes app bar, drawer, body, floating action buttons, etc.

// ### `SafeArea`

// Ensures child widgets are not hidden by system UI (like notches or status bars).

// ### `Column`

// Lays out widgets **vertically**.

// ### `Row`

// Lays out widgets **horizontally**.

// ### `Expanded`

// Takes up remaining space within `Row` or `Column`.

// ### `Padding`

// Adds empty space **inside or around** a widget.

// ### `SizedBox`

// A box of fixed width/height — often used for spacing.

// ### `Text`

// Displays text on screen.

// ### `Icon`

// Displays a Material Design icon.

// ### `SingleChildScrollView`

// Makes a single child scrollable — use for horizontal or vertical overflow.

// ---

// ## 📥 Input Widgets

// ### `TextEditingController`

// Controls the value and interaction of a text field (input).

// > Used to read/update text input programmatically.

// ### `DropdownMenu<T>`

// Material 3 dropdown input component.

// > Replaces the old `DropdownButton`. Allows selecting from a list of options.

// ### `DropdownMenuEntry<T>`

// Represents an individual item in a `DropdownMenu`.

// > Includes label, value, icon, and styling options.

// ---

// ## 🎨 Styling & Theming

// ### `ThemeData`

// Used to configure the visual aspects of your app (like colors, fonts, etc.)

// ### `colorSchemeSeed`

// Auto-generates a cohesive color scheme from a base color (Material You style).

// ### `InputDecorationTheme`

// Sets default styles for `TextField` and `DropdownMenu` (padding, border, etc.)

// ### `IconData`

// Represents the actual icon (like `Icons.favorite`, `Icons.cloud_outlined`).

// ---

// ## 🔁 Flutter State & Lifecycle

// ### `StatefulWidget`

// A widget that can hold mutable state which changes over time.

// ### `State<T>`

// Holds and manages the state of a `StatefulWidget`.

// ### `setState()`

// Notifies the Flutter framework that state has changed, so it can rebuild the UI.

// ---

// ## 🌈 Extras

// ### `leadingIcon`

// An icon shown on the left side of a dropdown or menu entry.

// ### `enabled`

// A flag to make a dropdown item selectable or disabled (grayed out).

// ---

// ## 🧠 Summary

// | Feature                 | Definition                                          |
// | ----------------------- | --------------------------------------------------- |
// | `enum`                  | Defines fixed, named constant values                |
// | `typedef`               | Defines an alias for a type                         |
// | `UnmodifiableListView`  | Immutable read-only list                            |
// | `TextEditingController` | Controls a text field’s value                       |
// | `DropdownMenu`          | Material 3 dropdown selector                        |
// | `DropdownMenuEntry`     | Represents an item in a dropdown                    |
// | `SingleChildScrollView` | Adds scroll to a child when content overflows       |
// | `SafeArea`              | Keeps content away from system UI                   |
// | `setState()`            | Triggers a widget rebuild on state change           |
// | `ThemeData`             | Customizes the look of your app                     |
// | `IconData`              | Stores icon information from the Material icons set |

// ---

// Would you like visuals, diagrams, or real-world examples for any of these?
