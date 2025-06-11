import 'package:flutter/material.dart';

class AdaptiveCheckboxRadioExample extends StatefulWidget {
  const AdaptiveCheckboxRadioExample({super.key});

  @override
  State<AdaptiveCheckboxRadioExample> createState() => _AdaptiveCheckboxRadioExampleState();
}

class _AdaptiveCheckboxRadioExampleState extends State<AdaptiveCheckboxRadioExample> {
  bool _isChecked = false;
  String _selectedOption = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adaptive Checkbox & Radio')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Adaptive Checkbox
            Row(
              children: [
                Checkbox.adaptive(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                const Text('Accept terms and conditions'),
              ],
            ),
            const SizedBox(height: 24),

            // Adaptive Radio Buttons
            const Text('Choose your option:'),
            ListTile(
              leading: Radio.adaptive(
                value: 'A',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
              title: const Text('Option A'),
            ),
            ListTile(
              leading: Radio.adaptive(
                value: 'B',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
              title: const Text('Option B'),
            ),
          ],
        ),
      ),
    );
  }
}
