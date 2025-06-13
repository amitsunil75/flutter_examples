import 'package:flutter/material.dart';



class ChipDemoPage extends StatefulWidget {
  const ChipDemoPage({super.key});

  @override
  State<ChipDemoPage> createState() => _ChipDemoPageState();
}

class _ChipDemoPageState extends State<ChipDemoPage> {
  // FilterChip states
  List<String> filterOptions = ['Red', 'Green', 'Blue'];
  List<bool> selectedFilters = [false, false, false];

  // ChoiceChip state
  List<String> choiceOptions = ['Trending', 'Latest', 'Favorites'];
  int? selectedChoice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chip Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              '🎯 FilterChip.elevated (Multi-select):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 10,
              children: List.generate(filterOptions.length, (index) {
                return FilterChip.elevated(
                  label: Text(filterOptions[index]),
                  selected: selectedFilters[index],
                  onSelected: (bool value) {
                    setState(() {
                      selectedFilters[index] = value;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 30),

            const Text(
              '🔘 ChoiceChip.elevated (Single-select):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 10,
              children: List.generate(choiceOptions.length, (index) {
                return ChoiceChip.elevated(
                  label: Text(choiceOptions[index]),
                  selected: selectedChoice == index,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedChoice = selected ? index : null;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 30),

            const Text(
              '⚡ ActionChip.elevated (Perform Actions):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 10,
              children: [
                ActionChip.elevated(
                  label: const Text('Undo'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Undo action performed')),
                    );
                  },
                ),
                ActionChip.elevated(
                  label: const Text('Reply'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Reply clicked')),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
