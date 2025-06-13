// Here's a **clear breakdown** of `FilterChip.elevated`, `ChoiceChip.elevated`, and `ActionChip.elevated` in Flutter, with **definitions**, **real-world use cases**, and a **Scaffold-level example for each** — clean, real, and ready to plug in.

// ---

// ## 🔹 `FilterChip.elevated`

// ### 🔸 Definition:

// A chip that represents a **filter** option that can be **toggled on/off**. It’s **multi-selectable**.

// ### 🔸 Real-World Use Case:

// Use for toggling **multiple filters** in shopping apps (e.g., color, brand, size).

// ### 🔸 Example (Scaffold only):

// ```dart
// Scaffold(
//   body: Center(
//     child: Wrap(
//       spacing: 10,
//       children: List.generate(3, (index) {
//         final labels = ['Red', 'Green', 'Blue'];
//         return FilterChip.elevated(
//           label: Text(labels[index]),
//           selected: _selected[index],
//           onSelected: (bool value) {
//             setState(() {
//               _selected[index] = value;
//             });
//           },
//         );
//       }),
//     ),
//   ),
//);
// ```

// Add this to your widget:

// ```dart
// List<bool> _selected = [false, false, false];
// ```

// ---

// ## 🔹 `ChoiceChip.elevated`

// ### 🔸 Definition:

// A chip for **single selection** among a set of options.

// ### 🔸 Real-World Use Case:

// Use for choosing **one category** in a news or recipe app (e.g., "Trending", "Latest", "Favorites").

// ### 🔸 Example:

// ```dart
// Scaffold(
//   body: Center(
//     child: Wrap(
//       spacing: 10,
//       children: List.generate(3, (index) {
//         final labels = ['Trending', 'Latest', 'Favorites'];
//         return ChoiceChip.elevated(
//           label: Text(labels[index]),
//           selected: _choiceIndex == index,
//           onSelected: (bool selected) {
//             setState(() {
//               _choiceIndex = selected ? index : null;
//             });
//           },
//         );
//       }),
//     ),
//   ),
//);
// ```

// Add this to your widget:

// ```dart
// int? _choiceIndex = 0;
// ```

// ---

// ## 🔹 `ActionChip.elevated`

// ### 🔸 Definition:

// A chip that performs an **action** when tapped — like a small button.

// ### 🔸 Real-World Use Case:

// Used for **actions with context**, like replying to a message, undoing an operation, or showing a snackbar.

// ### 🔸 Example:

// ```dart
// Scaffold(
//   body: Center(
//     child: Wrap(
//       spacing: 10,
//       children: [
//         ActionChip.elevated(
//           label: Text('Undo'),
//           onPressed: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Undo clicked')),
//             );
//           },
//         ),
//         ActionChip.elevated(
//           label: Text('Reply'),
//           onPressed: () {
//             print('Reply tapped');
//           },
//         ),
//       ],
//     ),
//   ),
// );
// ```

// ---

// ## 🔁 Summary Table

// | Chip Type    | Selection Type  | Use Case Example            | Multi-select? | Looks like    |
// | ------------ | --------------- | --------------------------- | ------------- | ------------- |
// | `FilterChip` | Toggle (on/off) | Filters (e.g., Color, Size) | ✅ Yes         | Checkbox chip |
// | `ChoiceChip` | One of many     | Categories (e.g., News)     | ❌ No          | Radio chip    |
// | `ActionChip` | Tap to act      | Commands (e.g., Reply)      | ❌ No          | Small button  |

// ---

// Let me know if you want a side-by-side visual comparison or want all of them combined into one real-world app UI!
