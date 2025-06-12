import 'package:flutter/material.dart';

class PizzaCustomizerScreen extends StatefulWidget {
  const PizzaCustomizerScreen({super.key});

  @override
  State<PizzaCustomizerScreen> createState() => _PizzaCustomizerScreenState();
}

class _PizzaCustomizerScreenState extends State<PizzaCustomizerScreen> {
  // Selection values
  String _selectedSize = 'Medium';
  String _selectedCrust = 'Thin Crust';
  String _selectedSpice = 'Medium';

  // Pricing maps
  final Map<String, int> sizePrices = {
    'Small': 150,
    'Medium': 200,
    'Large': 250,
  };

  final Map<String, int> crustPrices = {
    'Thin Crust': 0,
    'Cheese Burst': 50,
    'Whole Wheat': 20,
  };

  final List<String> spiceLevels = ['Mild', 'Medium', 'Spicy'];

  int _calculateTotalPrice() {
    final sizePrice = sizePrices[_selectedSize] ?? 0;
    final crustPrice = crustPrices[_selectedCrust] ?? 0;
    return sizePrice + crustPrice;
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = _calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(title: const Text('Pizza Customizer')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('🍕 Select Pizza Size:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...sizePrices.keys.map((size) => RadioListTile<String>(
                title: Text('$size (₹${sizePrices[size]})'),
                value: size,
                groupValue: _selectedSize,
                onChanged: (value) => setState(() => _selectedSize = value!),
              )),

          const SizedBox(height: 20),
          const Text('🧀 Select Crust Type:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...crustPrices.keys.map((crust) => RadioListTile<String>(
                title: Text('$crust (+₹${crustPrices[crust]})'),
                value: crust,
                groupValue: _selectedCrust,
                onChanged: (value) => setState(() => _selectedCrust = value!),
              )),

          const SizedBox(height: 20),
          const Text('🌶️ Choose Spice Level:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...spiceLevels.map((level) => RadioListTile<String>(
                title: Text(level),
                value: level,
                groupValue: _selectedSpice,
                onChanged: (value) => setState(() => _selectedSpice = value!),
              )),

          const Divider(height: 40, thickness: 1.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('₹$totalPrice', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaSummaryScreen(
                    size: _selectedSize,
                    crust: _selectedCrust,
                    spice: _selectedSpice,
                    totalPrice: totalPrice,
                    sizePrice: sizePrices[_selectedSize]!,
                    crustPrice: crustPrices[_selectedCrust]!,
                  ),
                ),
              );
            },
            child: const Text('Review Order'),
          ),
        ],
      ),
    );
  }
}

class PizzaSummaryScreen extends StatelessWidget {
  final String size;
  final String crust;
  final String spice;
  final int totalPrice;
  final int sizePrice;
  final int crustPrice;

  const PizzaSummaryScreen({
    super.key,
    required this.size,
    required this.crust,
    required this.spice,
    required this.totalPrice,
    required this.sizePrice,
    required this.crustPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pizza Summary')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🍕 Size: $size - ₹$sizePrice', style: const TextStyle(fontSize: 16)),
            Text('🧀 Crust: $crust - ₹$crustPrice', style: const TextStyle(fontSize: 16)),
            Text('🌶️ Spice: $spice - ₹0', style: const TextStyle(fontSize: 16)),
            const Divider(height: 30, thickness: 1),
            Text('💰 Total Price: ₹$totalPrice', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Thank you for customizing your pizza! 🍽️'),
          ],
        ),
      ),
    );
  }
}
