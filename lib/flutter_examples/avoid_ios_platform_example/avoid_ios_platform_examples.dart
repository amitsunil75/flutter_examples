import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AvoidIosPlatformExamples extends StatefulWidget {
  const AvoidIosPlatformExamples({super.key});

  @override
  State<AvoidIosPlatformExamples> createState() => _AvoidIosPlatformExamplesState();
}

class _AvoidIosPlatformExamplesState extends State<AvoidIosPlatformExamples> {
  bool shouldAllowPurchaseClick() {
    // Banned by Apple App Store guidelines. 
    return !Platform.isIOS;
  }

  @override
  Widget build(BuildContext context) {
    final recognizer = shouldAllowPurchaseClick()
        ? (TapGestureRecognizer()
          ..onTap = () async {
            final url = Uri.parse('https://example.com');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              print('Could not launch URL');
            }
          })
        : null;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: RichText(
            text: TextSpan(
              text: 'Buy in Browser',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 18,
                decoration: TextDecoration.underline,
              ),
              recognizer: recognizer,
            ),
          ),
        ),
      ),
    );
  }
}


// Absolutely! Let's break down the Flutter code **line by line** so you understand every concept used — including `TextSpan`, gesture recognizers, the `..` operator (cascade), and the logic for adapting behavior based on platform (iOS vs others).

// ---

// ## ✅ Full Annotated Code with Explanations

// ```dart
// // Importing Dart's IO library for platform detection (like checking if the app is on iOS).
// import 'dart:io';

// // Flutter packages for gesture recognition and UI.
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// // This package helps open URLs in the browser or appropriate app.
// import 'package:url_launcher/url_launcher.dart';
// ```

// ---

// ```dart
// class AvoidIosPlatformExamples extends StatefulWidget {
//   const AvoidIosPlatformExamples({super.key});

//   @override
//   State<AvoidIosPlatformExamples> createState() => _AvoidIosPlatformExamplesState();
// }
// ```

// ### 🔍 What's happening here?

// * `StatefulWidget`: We're building a widget that **has mutable state**.
// * `AvoidIosPlatformExamples`: The widget class.
// * `createState()`: Creates the state object `_AvoidIosPlatformExamplesState`.

// ---

// ```dart
// class _AvoidIosPlatformExamplesState extends State<AvoidIosPlatformExamples> {
// ```

// This is the state class where we keep logic and UI. It inherits from `State<AvoidIosPlatformExamples>`.

// ---

// ```dart
//   bool shouldAllowPurchaseClick() {
//     // Apple App Store doesn't allow redirecting to web purchases.
//     return !Platform.isIOS;  // returns false on iOS, true otherwise.
//   }
// ```

// * `Platform.isIOS`: A property from `dart:io` that checks if the app is running on an iOS device.
// * The method returns `true` if **not iOS**, and `false` if it's iOS.

// ---

// ```dart
//   @override
//   Widget build(BuildContext context) {
// ```

// The `build()` method builds the UI.

// ---

// ```dart
//     final recognizer = shouldAllowPurchaseClick()
//         ? (TapGestureRecognizer()
//           ..onTap = () async {
// ```

// ### 🔍 Let's unpack this:

// * `shouldAllowPurchaseClick() ? ... : null`: If allowed (not iOS), we create a `TapGestureRecognizer`. Else, we set it to `null`.
// * `TapGestureRecognizer()`: A class used to detect tap gestures.
// * `..onTap = () { ... }`:

//   * This is the **cascade operator `..`**, used to **perform multiple operations** on the same object.
//   * Instead of:

//     ```dart
//     var recognizer = TapGestureRecognizer();
//     recognizer.onTap = ...
//     ```

//     You do it **in one expression**:

//     ```dart
//     var recognizer = TapGestureRecognizer()..onTap = ...
//     ```

// ---

// ```dart
//             final url = Uri.parse('https://example.com');
//             if (await canLaunchUrl(url)) {
//               await launchUrl(url);
//             } else {
//               print('Could not launch URL');
//             }
// ```

// * `Uri.parse(...)`: Converts a string to a `Uri` object.
// * `canLaunchUrl`: Checks if the URL can be opened.
// * `launchUrl`: Actually opens the URL.
// * `await`: Because these functions are asynchronous (they take time), we wait for them to complete.

// ---

// ```dart
//           })
//         : null;
// ```

// This completes the conditional expression. If `shouldAllowPurchaseClick()` is `false`, `recognizer` will be `null`.

// ---

// ```dart
//     return Scaffold(
// ```

// `Scaffold` gives us a basic page layout with body, app bar, etc.

// ---

// ```dart
//       body: SafeArea(
// ```

// * `SafeArea`: Prevents the content from going under notches or system UI elements (like status bar or notch).

// ---

// ```dart
//         child: Center(
// ```

// * Centers the content on the screen.

// ---

// ```dart
//           child: RichText(
// ```

// * `RichText`: Widget used to display **styled text** with multiple `TextSpan`s or recognizers.

// ---

// ```dart
//             text: TextSpan(
// ```

// * `TextSpan`: Represents a styled segment of text.
// * Unlike `Text`, this allows **multiple styles and tap actions** in one paragraph.

// ---

// ```dart
//               text: 'Buy in Browser',
//               style: const TextStyle(
//                 color: Colors.blue,
//                 fontSize: 18,
//                 decoration: TextDecoration.underline,
//               ),
// ```

// ### 🔍 Explanation of style:

// * `color: Colors.blue`: Text is blue.
// * `fontSize: 18`: Font size is 18.
// * `decoration: TextDecoration.underline`: Adds underline to text.

// ---

// ```dart
//               recognizer: recognizer,
//             ),
// ```

// * This is where we attach the tap behavior (`TapGestureRecognizer`) to the text.
// * On **tap**, if not iOS, the browser opens the link.

// ---

// ```dart
//           ),
//         ),
//       ),
//     );
//   }
// }
// ```

// * Closes all widgets in reverse order.

// ---

// ## ✅ Summary of Key Concepts

// | Concept                 | Meaning                                                    |
// | ----------------------- | ---------------------------------------------------------- |
// | `TextSpan`              | A piece of styled text, can be tappable via `recognizer`.  |
// | `RichText`              | Displays `TextSpan` and supports multiple styles.          |
// | `TapGestureRecognizer`  | Detects taps on text or other gesture-sensitive areas.     |
// | `Platform.isIOS`        | Checks if app is running on iOS.                           |
// | `..` (Cascade Operator) | Lets you do multiple operations on the same object inline. |
// | `Uri.parse`             | Turns string into `Uri` object.                            |
// | `launchUrl()`           | Opens a URL in browser or app.                             |
// | `SafeArea`              | Keeps widgets away from notches or overlays.               |

// ---

// Would you like me to convert this into a version with **multiple tappable spans** (like email and phone), or add logic for **disabled text** on iOS?



// Absolutely! Let's explain the **`..` (double dot)** and **`...` (triple dot)** in Flutter like you're a *very young learner* — slow, gentle, and with cute examples. 🧸

// ---

// ## 🟦 1. What is `..` (double dot)?

// ### Think of `..` like saying:

// > “Do something to this toy **again and again** without putting it down.”

// In code, `..` is called a **cascade operator**. It means:

// > “Use the same object again for the next thing too.”

// ---

// ### 🧸 Example:

// Imagine you have a teddy bear named `teddy`. You want to:

// 1. Put a hat on the teddy
// 2. Give the teddy a hug

// Instead of:

// ```dart
// teddy.putHat();
// teddy.hug();
// ```

// You can write:

// ```dart
// teddy
//   ..putHat()
//   ..hug();
// ```

// ➡ You’re doing many things to the **same teddy**, without repeating `teddy` every time.

// ---

// ### 🧪 Flutter example:

// ```dart
// TextField()
//   ..controller = nameController
//   ..autofocus = true;
// ```

// This means:

// > “Make a TextField, then give it a controller, and also make it autofocus — all on the same TextField.”

// ---

// ## 🟨 2. What is `...` (triple dot)?

// ### Think of `...` like saying:

// > “Take all the toys from **this box**, and put them **in another box**.”

// In code, `...` is called the **spread operator**.

// It means:

// > “Open this list and put **everything inside** into another list.”

// ---

// ### 🧸 Example:

// You have:

// ```dart
// List<String> snacks = ['🍪', '🍭'];
// ```

// And now you want to make a bigger snack box:

// ```dart
// List<String> bigBox = ['🍫', ...snacks, '🍩'];
// ```

// Now `bigBox` is:

// ```dart
// ['🍫', '🍪', '🍭', '🍩']
// ```

// ✨ The `...` *unpacks* the `snacks` and adds each one into the new list.

// ---

// ### 🧪 Flutter example:

// ```dart
// Column(
//   children: [
//     Text('Hello'),
//     ...myWidgets,  // <- adds all widgets from myWidgets list
//     Text('Bye'),
//   ],
// )
// ```

// ---

// ## ✅ TL;DR

// | Symbol | Name             | Think of it like...                               | Use for...                                                 |
// | ------ | ---------------- | ------------------------------------------------- | ---------------------------------------------------------- |
// | `..`   | Cascade operator | "Do this, and this, to the same object"           | Call multiple methods or set properties on the same object |
// | `...`  | Spread operator  | "Take all items from this list and add them here" | Merge lists of widgets/items                               |

// ---

// Want to see a working example with both? 😊
