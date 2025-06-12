import 'package:flutter/material.dart';

// Dummy product detail page
class ProductDetailPage extends StatelessWidget {
  final String productName;

  const ProductDetailPage({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Center(
        child: Text(
          'Details for $productName',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Page with PageStorageKey — scroll will be remembered
class ProductListWithStorageKey extends StatelessWidget {
  const ProductListWithStorageKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products (With Key)')),
      body: ListView.builder(
        key: const PageStorageKey<String>('with-key'),
        itemCount: 100,
        itemBuilder: (context, index) {
          final productName = 'Product $index';
          return ListTile(
            title: Text(productName),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailPage(productName: productName),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Page WITHOUT PageStorageKey — scroll resets on return
class ProductListWithoutStorageKey extends StatelessWidget {
  const ProductListWithoutStorageKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products (No Key)')),
      body: ListView.builder(
        // No PageStorageKey here!
        itemCount: 100,
        itemBuilder: (context, index) {
          final productName = 'Product $index';
          return ListTile(
            title: Text(productName),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailPage(productName: productName),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


// You're absolutely right:
// **stock updates** and **`PageStorageKey`** are completely **unrelated**. ✅

// ---

// ## 🔗 Clarifying the Two Concepts:

// ### 🟨 `PageStorageKey`

// * Used for **state persistence** of scroll position or other widget-specific state **across navigations**.
// * Example use: In a product list page, if you scroll halfway and go to product details, then come back — you'll land on the same scroll spot.

// ### 🟩 Stock Updates

// * This is **business logic** (data layer) about real-time inventory.
// * Controlled via **streams, APIs, or database listeners**.
// * It affects what's **displayed** (e.g., "In stock" vs "Out of stock").

// ---

// ### 🧠 Why They’re Not Linked:

// `PageStorageKey` is all about the **UI state** of widgets — it remembers the position of the list.

// Real-time **stock changes** are data-driven events unrelated to widget memory — they happen **regardless of scroll or navigation**.

// ---

// Would you like to see how `PageStorageKey` helps in `TabBarView` or with multiple pages, where it's even more useful?


// Absolutely! Let's walk through what's happening in this small **real-time e-commerce Flutter app** example in clear, structured words.

// ---

// ## 🛒 Overview of the App

// This Flutter app is a **simple e-commerce prototype** that simulates real-time product updates (like stock changes). The UI consists of:

// 1. A **product list page** that displays items.
// 2. A **product details page** when a product is tapped.
// 3. The app includes simulated real-time updates using a **stream**, and uses **`PageStorageKey`** to preserve scroll position when navigating between pages.

// ---

// ## 🧱 Technologies and Concepts Used

// ### 1. **Flutter Widgets**

// * `MaterialApp`, `Scaffold`, `AppBar`, `ListView.builder`, `Text`, `TextButton`, `ElevatedButton`, `StreamBuilder`, etc.

// ### 2. **`StreamBuilder`**

// * This widget listens to a stream and rebuilds UI when new data comes.
// * Here, we use it to simulate **real-time stock changes** of products every 3 seconds using `StreamController`.

// ### 3. **`PageStorageKey`**

// * It's used to **save the scroll position** of the product list.
// * So, when you go to the product details and return, you land on the same scroll spot (just like most e-commerce apps do).

// ### 4. **Navigation**

// * Simple Flutter navigation using `Navigator.push()` to go from the list page to the product detail page.

// ---

// ## 🔄 Real-time Behavior (Simulated)

// * A custom `ProductService` class creates a `Stream<List<Product>>`.
// * Every 3 seconds, the stock values of products change.
// * These changes are **pushed into the stream**, and the `StreamBuilder` picks them up and updates the UI in real-time.
// * This simulates how real-time e-commerce systems (like Amazon or Flipkart) might show **changing stock availability**.

// ---

// ## 👤 User Experience Flow

// 1. The app starts with a **product list** showing:

//    * Name
//    * Price
//    * Current stock (updated every few seconds)

// 2. The user taps on a product to see **detailed view**, including:

//    * Title
//    * Price
//    * Stock
//    * An **"Add to Cart"** button (enabled only if in stock)

// 3. When they press **back**, the scroll position in the product list remains the same — thanks to `PageStorageKey`.

// ---

// ## 🧠 Real-World Usage Example

// Imagine this app being used by a small online store that:

// * Lists electronic products.
// * Receives real-time inventory updates from a backend.
// * Allows customers to check product details before adding to cart.
// * Preserves the user’s scroll position to improve usability and make the app feel polished.

// ---

// ## 🔍 Why This Example Is Valuable

// * **Real-time simulation** is essential in modern apps to show live data.
// * **Navigation and state retention** are critical for user experience.
// * The app can easily be scaled to support real backend services like **Firebase, REST APIs, or GraphQL**.

// ---

// Would you like a version of this example with Firebase Firestore as a real backend or a more advanced cart and checkout system added?
