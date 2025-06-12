import 'package:flutter/material.dart';

class ToppingSelectionScreen extends StatefulWidget {
  const ToppingSelectionScreen({super.key});

  @override
  State<ToppingSelectionScreen> createState() => _ToppingSelectionScreenState();
}

class _ToppingSelectionScreenState extends State<ToppingSelectionScreen> {
  final Map<String, bool> _toppings = {
    'Extra Cheese': false,
    'Mushrooms': false,
    'Pepperoni': false,
    'Olives': false,
    'Onions': false,
    'Green Peppers': false,
    'Pineapple': false,
    'Bacon': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Toppings')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: _toppings.keys.map((String key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: _toppings[key],
                  onChanged: (bool? value) {
                    setState(() {
                      _toppings[key] = value ?? false;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            child: const Text('Review Order'),
            onPressed: () {
              List<String> selected = _toppings.entries
                  .where((entry) => entry.value)
                  .map((entry) => entry.key)
                  .toList();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderSummaryScreen(selectedToppings: selected),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OrderSummaryScreen extends StatelessWidget {
  final List<String> selectedToppings;

  const OrderSummaryScreen({super.key, required this.selectedToppings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Summary')),
      body: selectedToppings.isEmpty
          ? const Center(child: Text('No toppings selected.'))
          : ListView.builder(
              itemCount: selectedToppings.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.check),
                  title: Text(selectedToppings[index]),
                );
              },
            ),
    );
  }
}
