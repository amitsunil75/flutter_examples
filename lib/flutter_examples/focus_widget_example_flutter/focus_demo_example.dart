import 'package:flutter/material.dart';


class FocusFormScreen extends StatefulWidget {
  const FocusFormScreen({super.key});

  @override
  State<FocusFormScreen> createState() => _FocusFormScreenState();
}

class _FocusFormScreenState extends State<FocusFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _submitFocus = FocusNode();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(() => setState(() {}));
    _passwordFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _submitFocus.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus Scope & Traversal Demo')),
      body: FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login Form',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                FocusTraversalOrder(
                  order: const NumericFocusOrder(1.0),
                  child: TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: _emailFocus.hasFocus
                          ? const Color.fromARGB(255, 116, 158, 68)
                          : Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                FocusTraversalOrder(
                  order: const NumericFocusOrder(2.0),
                  child: TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                      ),
                      filled: true,
                      fillColor: _passwordFocus.hasFocus
                          ? const Color.fromARGB(255, 3, 117, 170)
                          : Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                FocusTraversalOrder(
                  order: const NumericFocusOrder(3.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      focusNode: _submitFocus,
                      onPressed: _submitForm,
                      child: const Text('Submit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// Great question! Let's break it down clearly with real-world analogy and explanation:

// ---

// ### 🔍 What is **FocusTraversalOrder** (with 1, 2, 3)?

// Think of it as the **tab order** or **keyboard navigation order** for your form fields.

// #### ✅ Example:

// In this code:

// ```dart
// FocusTraversalOrder(
//   order: NumericFocusOrder(1.0), // Email
// )
// FocusTraversalOrder(
//   order: NumericFocusOrder(2.0), // Password
// )
// FocusTraversalOrder(
//   order: NumericFocusOrder(3.0), // Submit button
// )
// ```

// You're telling Flutter:

// > "When the user presses **Tab** or navigates with a keyboard/controller, go to `1 → 2 → 3` in that order."

// So:

// * Focus starts on Email field.
// * Pressing Tab moves focus to Password.
// * Tab again goes to Submit.

// ---

// ### 🧠 What is **OrderedTraversalPolicy**?

// `OrderedTraversalPolicy()` is the **strategy** that says:

// > "Hey Flutter, respect the NumericFocusOrder values (like 1, 2, 3) when deciding where to move focus next."

// #### Without it:

// Flutter will use the **default `ReadingOrderTraversalPolicy`**, which focuses widgets based on layout (left to right, top to bottom).

// #### With `OrderedTraversalPolicy()`:

// You **take control** and define **custom focus order**, even if the layout doesn't follow it.

// ---

// ### 🏠 Real-world Analogy:

// Imagine a house with three rooms:

// * Room A (focus order 2)
// * Room B (focus order 1)
// * Room C (focus order 3)

// By default (without ordering), if they're aligned left-to-right, you'd visit A → B → C.
// But using `OrderedTraversalPolicy`, you’re telling someone:

// > "No, I want to visit Room B (1) first, then A (2), then C (3), regardless of layout."

// ---

// ### ✨ Summary

// | Term                                               | Meaning                              | Why Use                                            |
// | -------------------------------------------------- | ------------------------------------ | -------------------------------------------------- |
// | `FocusTraversalOrder(order: NumericFocusOrder(x))` | Sets a number to decide order        | To manually set tab/focus sequence                 |
// | `OrderedTraversalPolicy()`                         | Strategy to follow your custom order | Overrides Flutter’s default layout-based traversal |
// | `FocusTraversalGroup`                              | Groups focusable widgets together    | So the policy applies only to that group           |

// ---

// Let me know if you want a visual diagram or interactive version to try out focus behavior!

// Sure! Here's a clear explanation of how the code works and **why each part is used**, without repeating the full code:

// ---

// ### 🔐 **Form and Validation**

// * **`Form` & `GlobalKey<FormState>`**
//   Used to manage and validate form inputs. The `GlobalKey` lets us call `.validate()` and `.save()` methods from outside the form tree.

// * **`TextFormField`**
//   Used to collect user input like email and password with built-in validation via `validator`.

// ---

// ### 🔍 **Focus Management**

// * **`FocusNode`**
//   Each `TextFormField` uses a `FocusNode` to track if it has focus (e.g., keyboard cursor is inside).
//   We listen to focus changes to update the UI (like changing colors).

// * **`FocusScope`**
//   Groups a set of widgets together and controls the overall focus logic. It manages **which node gets focused next** when pressing Tab or navigating.

// * **`FocusTraversalGroup`**
//   Defines an independent focus traversal group for its subtree. It allows us to customize tab order locally without affecting other widgets.

// * **`FocusTraversalOrder`**
//   Lets us define **custom focus order**, e.g., focusing the "Second" button before the "First". Useful in forms with complex layouts.

// ---

// ### 🧭 **FocusableActionDetector**

// * Combines:

//   * `Focus`: to manage keyboard focus.
//   * `MouseRegion`: for hover effects.
//   * `Actions` & `Shortcuts`: to handle key bindings.
// * Used for widgets like buttons to make them respond visually and functionally to focus/hover/keyboard actions.

// ---

// ### 👁️‍🗨️ **Password Hide/Show**

// * **`_obscurePassword` + `IconButton` in `suffixIcon`**
//   Lets user toggle between showing and hiding their password.

// ---

// ### 📥 **TextEditingController**

// * Controls the text inside each `TextFormField` and allows reading or modifying it from code.

// ---

// ### 📦 **Why this is a real-world example**

// * Mimics **Login forms** in production apps:

//   * Validates fields before submission.
//   * Manages focus traversal correctly for usability.
//   * Visually highlights focus states.
//   * Uses material design patterns.

// ---

// Would you like me to explain how focus traversal works during Tab presses, or how `FocusableActionDetector` handles keyboard shortcuts?
// Great! Let’s break down both in a **real-world and technical** sense:

// ---

// ## ✅ **1. How Focus Traversal Works (Tab/Shift+Tab Navigation)**

// ### 🔁 **What happens when you press Tab?**

// * Flutter uses a **FocusTraversalPolicy** to decide which widget should receive focus next.
// * By default, it's the **`ReadingOrderTraversalPolicy`**, which uses the visual order of widgets (left-to-right, top-to-bottom for LTR languages).

// ### 🚦 Key Components Involved:

// * **`FocusNode`**: Each focusable widget (like `TextFormField`) needs a `FocusNode`.
// * **`FocusScopeNode` / `FocusScope`**: Think of this as a zone that keeps track of the "currently focused" child. Pressing Tab moves focus within this group.
// * **`FocusTraversalGroup`**: Wraps a section of the UI to **isolate** or **customize** how traversal works within that area.
// * **`FocusTraversalOrder`**: Lets you override the natural order by giving priorities (like `NumericFocusOrder(1)`, `2`, etc).

// ### 🧠 Example Use Case:

// * In a login form:
//   Pressing **Tab** moves from `Email ➜ Password ➜ Login Button`
//   You can **reorder** this if needed using `FocusTraversalOrder`.

// ---

// ## 🎯 **2. How FocusableActionDetector Handles Shortcuts & Focus**

// ### 🔄 What is `FocusableActionDetector`?

// It’s a **combo widget** that gives you:

// * Focus handling ✅
// * Keyboard shortcut actions ✅
// * Hover/focus highlights ✅

// Instead of using all those widgets separately (`Focus`, `MouseRegion`, `Shortcuts`, `Actions`), this combines them into one.

// ### 🔑 Keyboard Shortcuts

// You can define shortcuts like:

// ```dart
// Shortcuts(
//   shortcuts: <LogicalKeySet, Intent>{
//     LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
//   },
//   child: Actions(
//     actions: <Type, Action<Intent>>{
//       ActivateIntent: CallbackAction<Intent>(
//         onInvoke: (Intent intent) => print("Activated"),
//       ),
//     },
//     child: YourWidget(),
//   ),
// );
// ```

// ### But `FocusableActionDetector` simplifies this:

// ```dart
// FocusableActionDetector(
//   shortcuts: {...},
//   actions: {...},
//   onShowFocusHighlight: (focused) => ...,
//   child: ...
// )
// ```

// ### 💡 Real Use Case:

// Imagine a **custom widget** like a fancy card or button that:

// * Highlights on hover
// * Gets a blue border when focused
// * Responds to `Enter` key to activate

// That’s what `FocusableActionDetector` is designed for.

// ---

// ## 📝 Summary

// | Feature                   | Purpose                                                |
// | ------------------------- | ------------------------------------------------------ |
// | `FocusScope`              | Groups focusable widgets                               |
// | `FocusTraversalGroup`     | Controls tab order locally                             |
// | `FocusTraversalOrder`     | Overrides default tab order                            |
// | `FocusableActionDetector` | Adds focus, keyboard, mouse, and actions in one widget |
// | `Shortcuts` + `Actions`   | Let you bind keys to app-specific behavior             |

// ---

// Would you like a mini project where these are used in a small UI component (like a custom card or form with shortcuts)?
