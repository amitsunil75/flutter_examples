import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;



class BankJsonApp extends StatelessWidget {
  const BankJsonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AnimatedBankUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimatedBankUI extends StatefulWidget {
  const AnimatedBankUI({super.key});

  @override
  State<AnimatedBankUI> createState() => _AnimatedBankUIState();
}

class _AnimatedBankUIState extends State<AnimatedBankUI> {
  List<dynamic> bankActions = [];
  List<bool> isTapped = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/images/config.json');
    setState(() {
      bankActions = json.decode(jsonString);
      isTapped = List.filled(bankActions.length, false);
    });
  }

  IconData getIcon(String name) {
    switch (name) {
      case 'account_balance_wallet':
        return Icons.account_balance_wallet;
      case 'money_off':
        return Icons.money_off;
      case 'book':
        return Icons.book;
      case 'local_atm':
        return Icons.local_atm;
      default:
        return Icons.help;
    }
  }

  Color parseColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    return Color(int.parse('FF$hexColor', radix: 16));
  }

  void animate(int index) {
    setState(() => isTapped[index] = true);
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => isTapped[index] = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${bankActions[index]['title']} selected')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Bank Menu"),
        backgroundColor: Colors.deepPurple,
      ),
      body: bankActions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                itemCount: bankActions.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final item = bankActions[index];
                  final color = parseColor(item['color']);
                  final icon = getIcon(item['icon']);
                  final title = item['title'];

                  return GestureDetector(
                    onTap: () => animate(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      transform: isTapped[index]
                          ? Matrix4.rotationZ(0.05 * (index + 1))
                          : Matrix4.identity(),
                      curve: Curves.easeOutBack,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                          )
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(icon, size: 40, color: Colors.white),
                            const SizedBox(height: 10),
                            Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
