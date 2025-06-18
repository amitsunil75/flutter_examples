import 'package:flutter/material.dart';



class BankExampleEachButtonDiffrentAnimation extends StatefulWidget {
  const BankExampleEachButtonDiffrentAnimation({super.key});

  @override
  State<BankExampleEachButtonDiffrentAnimation> createState() => _BankExampleEachButtonDiffrentAnimationState();
}

class _BankExampleEachButtonDiffrentAnimationState extends State<BankExampleEachButtonDiffrentAnimation> {
  final List<String> actions = ['Passbook', 'Deposit', 'Withdraw', 'ATM'];
  final List<Color> colors = [Colors.deepPurple, Colors.teal, Colors.orange, Colors.indigo];
  final List<IconData> icons = [Icons.book, Icons.account_balance_wallet, Icons.money_off, Icons.local_atm];

  List<bool> pressedStates = List.generate(4, (_) => false);

  void _onTap(int index) {
    setState(() => pressedStates[index] = true);
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => pressedStates[index] = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${actions[index]} clicked')),
      );
    });
  }

  Matrix4 _getTransform(int index, bool isPressed) {
    switch (index) {
      case 0:
        return isPressed ? Matrix4.rotationZ(0.05) : Matrix4.identity();
      case 1:
        return isPressed ? Matrix4.skewY(0.1) : Matrix4.identity();
      case 2:
        return isPressed ? Matrix4.diagonal3Values(0.9, 0.9, 1) : Matrix4.identity();
      case 3:
        return isPressed ? Matrix4.translationValues(0, -5, 0) : Matrix4.identity();
      default:
        return Matrix4.identity();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Bank Services'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: actions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            final isPressed = pressedStates[index];
            return GestureDetector(
              onTap: () => _onTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                transform: _getTransform(index, isPressed),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, isPressed ? 2 : 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icons[index], size: 40, color: Colors.white),
                      const SizedBox(height: 10),
                      Text(
                        actions[index],
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
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
