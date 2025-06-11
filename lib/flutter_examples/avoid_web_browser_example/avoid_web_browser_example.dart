import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class MobileOnlyWidget extends StatelessWidget {
  const MobileOnlyWidget({super.key});

  bool _isMobileSmallScreen(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return !kIsWeb && (Platform.isAndroid || Platform.isIOS) && width < 600;
  }

  @override
  Widget build(BuildContext context) {
    final isAllowed = _isMobileSmallScreen(context);
    return isAllowed
        ? const MobileContent()
        : const NotSupportedMessage();
  }
}

class MobileContent extends StatelessWidget {
  const MobileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.phone_android, size: 80, color: Colors.green),
        SizedBox(height: 16),
        Text(
          'Welcome, mobile user!',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

class NotSupportedMessage extends StatelessWidget {
  const NotSupportedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'This feature is only available on mobile devices with small screens.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: Colors.red),
      ),
    );
  }
}


// Ah, thanks for clarifying! You're referring to:

// ```dart
// import 'package:flutter/foundation.dart' show kIsWeb;
// ```

// Let me explain **line-by-line** and **in-depth**:

// ---

// ## ✅ What does `kIsWeb` do?

// `kIsWeb` is a **constant boolean** provided by Flutter that tells you **whether your app is running in a web browser**.

// ---

// ## ✅ So what does this line mean?

// ```dart
// import 'package:flutter/foundation.dart' show kIsWeb;
// ```

// ### Let’s break it down:

// ### 🔹 `import 'package:flutter/foundation.dart'`

// You're importing the **foundation library** from Flutter, which contains low-level building blocks like `kIsWeb`, `ChangeNotifier`, `ValueNotifier`, etc.

// ### 🔹 `show kIsWeb`

// This is a **selective import**. Instead of importing everything from `foundation.dart`, you're importing **only** the `kIsWeb` variable to reduce clutter.

// ✅ Equivalent to:

// ```dart
// import 'package:flutter/foundation.dart';
// ```

// …but this imports everything.

// ---

// ## ✅ How to use `kIsWeb`

// You can use it to run different code depending on the platform:

// ```dart
// if (kIsWeb) {
//   print('Running on Web');
// } else {
//   print('Running on Mobile/Desktop');
// }
// ```

// ---

// ## ✅ Example in a widget:

// ```dart
// Widget build(BuildContext context) {
//   return Center(
//     child: Text(
//       kIsWeb ? 'You are using the web app' : 'You are using the mobile/desktop app',
//     ),
//   );
// }
// ```

// ---

// ## ✅ Why is `kIsWeb` useful?

// Sometimes you want to:

// * Show/hide widgets based on platform.
// * Avoid features that don't work on the web (like `FilePicker`, `Camera`).
// * Redirect users (e.g., say “This app doesn’t support browser” on web).

// ---

// Would you like a real use-case widget where `kIsWeb` blocks certain features or shows a message like "Not available in browser"?
