import 'package:flutter/material.dart';

class PageStorageExample extends StatefulWidget {
  const PageStorageExample({super.key});

  @override
  State<PageStorageExample> createState() => _PageStorageExampleState();
}

class _PageStorageExampleState extends State<PageStorageExample> {
  int _currentIndex = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  final List<Widget> _pages = [
    const DummyListPage(title: 'Products', key: PageStorageKey('products')),
    const DummyListPage(title: 'Orders', key: PageStorageKey('orders')),
    const DummyListPage(title: 'Invoices', key: PageStorageKey('invoices')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageStorageKey Example')),
      body: PageStorage(
        bucket: _bucket,
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Invoices'),
        ],
      ),
    );
  }
}

class DummyListPage extends StatelessWidget {
  final String title;

  const DummyListPage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: key, // Essential for PageStorageKey to work
      itemCount: 50,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('$title Item #$index'),
          subtitle: Text('Details about $title item $index'),
          leading: const Icon(Icons.label),
        );
      },
    );
  }
}
// Great question!

// ### 🧩 What is `PageStorageKey` used for in Flutter?

// The `PageStorageKey` is used to **preserve the state of a widget** — especially things like:

// * **Scroll position**
// * **Form values**
// * **Tab index**
// * Any internal widget state that would normally reset when rebuilding.

// ---

// ### ✅ **When and Why You Use `PageStorageKey`**

// #### 1. **When switching between tabs or pages**

// 👉 **Use case:** User scrolls down in one tab (say, a product list), switches to another tab, then comes back — you want the scroll position to be the same.

// #### 2. **Inside a `PageView` or `ListView`**

// 👉 It helps Flutter **remember the state** of the child widgets even though they get rebuilt when swiping pages.

// #### 3. **With dynamic list screens**

// 👉 If you use a single widget class (`ListView`, `Form`, etc.) with changing data, `PageStorageKey` keeps track of **each version’s scroll/form state** separately.

// ---

// ### 🧨 Common Misconception

// > ❌ It **does NOT** persist state across app restarts (like if the user closes and reopens the app).

// ✅ That requires **state persistence** using packages like:

// * `shared_preferences`
// * `hive`
// * `get_storage`
// * `sqflite`

// ---

// ### 🧠 Real-World Scenarios

// | Scenario         | Why `PageStorageKey` helps                                          |
// | ---------------- | ------------------------------------------------------------------- |
// | E-commerce app   | Keeps scroll position on Home, Categories, and Cart tabs            |
// | Social media app | User scrolls down posts, taps on profile, returns — same scroll     |
// | News app         | User switches between World, Tech, Sports tabs without scroll reset |
// | Form with tabs   | Preserves field inputs or validation state on switching sections    |

// ---

// ### TL;DR

// * `PageStorageKey` is **for remembering widget state** within a session.
// * It's great for **scroll views**, **forms**, and **multi-page apps**.
// * It does **not persist** across full app closes — it’s for **temporary, session-only memory**.

// ---

// Would you like an example that includes form inputs or a TabBarView version that shows how PageStorageKey works in a different layout?
