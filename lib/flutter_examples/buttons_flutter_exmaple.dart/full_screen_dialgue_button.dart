// Here's a **complete Flutter example** demonstrating how to use `Dialog.fullscreen`, along with:

// * ✅ Full working code (in one file)
// * 💡 Explanation of *why*, *when*, and *where* it's used

// ---

// ## ✅ What is `Dialog.fullscreen`?

// `Dialog.fullscreen` is a special kind of dialog that **takes over the entire screen**, often used when:

// * You need a **focus-driven task** (e.g., a form, a step-by-step wizard, or onboarding)
// * You want to create a modal-like experience, but **not in a constrained dialog box**
// * You want **back navigation** support and a more **immersive layout**

// ---

// ## 📱 Full Code Example

// ```dart
import 'package:flutter/material.dart';

class FullscreenDialogDemo extends StatelessWidget {
  const FullscreenDialogDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog.fullscreen Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const MyFullscreenDialog(),
            );
          },
          child: const Text('Open Fullscreen Dialog'),
        ),
      ),
    );
  }
}

class MyFullscreenDialog extends StatelessWidget {
  const MyFullscreenDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fullscreen Dialog'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'This is a fullscreen dialog. You can use this when you want to present a detailed screen that captures user focus.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('Done'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ```

// ---

// ## 📌 When & Why to Use `Dialog.fullscreen`

// ### ✅ When to use:

// * For **form-heavy workflows**: editing a profile, multi-step form
// * For **onboarding or walkthrough screens**
// * When you want a **modal with AppBar/navigation**

// ### ✅ Why it's useful:

// * Looks like a **native screen transition**, especially on iOS/Android
// * Keeps the **modal context**, so user can go back without breaking navigation flow
// * **More flexible** than standard `showDialog` or `AlertDialog`

// ---

// Let me know if you want to add transitions, animations, or dynamic content to the fullscreen dialog!
