//import 'package:flutter/material.dart';
// class BankHomePage extends StatefulWidget {
//   const BankHomePage({super.key});

//   @override
//   State<BankHomePage> createState() => _BankHomePageState();
// }

// class _BankHomePageState extends State<BankHomePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late FocusNode _focusNode;
//   double _scale = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       lowerBound: 0.95,
//       upperBound: 1.0,
//       duration: const Duration(milliseconds: 150),
//       vsync: this,
//     )..addListener(() {
//         setState(() {
//           _scale = _controller.value;
//         });
//       });

//     _controller.forward();
//     _focusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }

//   Widget _buildBankButton({
//     required String label,
//     required VoidCallback onTap,
//     required IconData icon,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         _controller.reverse().then((_) {
//           _controller.forward();
//           onTap();
//         });
//       },
//       onDoubleTap: () => ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("$label double tapped")),
//       ),
//       onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Long press on $label")),
//       ),
//       child: FocusableActionDetector(
//         focusNode: _focusNode,
//         onShowFocusHighlight: (_) => setState(() {}),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           transform: Matrix4.identity()..scale(_scale),
//           margin: const EdgeInsets.symmetric(vertical: 12),
//           child: Card(
//             color: _focusNode.hasFocus ? Colors.indigoAccent : Colors.indigo,
//             elevation: _focusNode.hasFocus ? 12 : 6,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(icon, color: Colors.white),
//                   const SizedBox(width: 10),
//                   Text(
//                     label,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _handleAction(String action) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Action: $action')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MyBank'),
//         backgroundColor: Colors.indigo,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             _buildBankButton(
//               label: 'Deposit Cash',
//               icon: Icons.account_balance_wallet_outlined,
//               onTap: () => _handleAction('Deposit Cash'),
//             ),
//             _buildBankButton(
//               label: 'Withdraw from ATM',
//               icon: Icons.atm_outlined,
//               onTap: () => _handleAction('Withdraw from ATM'),
//             ),
//             _buildBankButton(
//               label: 'View Passbook',
//               icon: Icons.book_outlined,
//               onTap: () => _handleAction('View Passbook'),
//             ),
//             _buildBankButton(
//               label: 'Check Balance',
//               icon: Icons.account_balance_outlined,
//               onTap: () => _handleAction('Check Balance'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//problem every button has same animation and effects and color


// import 'package:flutter/material.dart';

// // void main() => runApp(const BankAnimatedUI());

// class BankAnimatedUI extends StatelessWidget {
//   const BankAnimatedUI({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Animated Bank UI',
//       debugShowCheckedModeBanner: false,
//       home: const BankHomePage(),
//     );
//   }
// }

// class BankHomePage extends StatefulWidget {
//   const BankHomePage({super.key});

//   @override
//   State<BankHomePage> createState() => _BankHomePageState();
// }

// class _BankHomePageState extends State<BankHomePage>
//     with TickerProviderStateMixin {
//   final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

//   late AnimationController _scaleCtrl;
//   late AnimationController _rotateCtrl;
//   late AnimationController _fadeCtrl;
//   late AnimationController _slideCtrl;

//   @override
//   void initState() {
//     super.initState();

//     _scaleCtrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//       lowerBound: 0.95,
//       upperBound: 1.0,
//     )..forward();

//     _rotateCtrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//       upperBound: 0.1,
//       lowerBound: -0.1,
//     )..repeat(reverse: true);

//     _fadeCtrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     )..forward();

//     _slideCtrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     )..forward();
//   }

//   @override
//   void dispose() {
//     for (final node in _focusNodes) {
//       node.dispose();
//     }
//     _scaleCtrl.dispose();
//     _rotateCtrl.dispose();
//     _fadeCtrl.dispose();
//     _slideCtrl.dispose();
//     super.dispose();
//   }

//   Widget _buildAnimatedCard({
//     required String label,
//     required IconData icon,
//     required Color color,
//     required FocusNode node,
//     required Animation animation,
//     required void Function() onTap,
//     required Widget Function(Widget) transition,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         onTap();
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Tapped $label")));
//       },
//       onLongPress: () {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Long pressed $label")));
//       },
//       child: FocusableActionDetector(
//         focusNode: node,
//         onShowFocusHighlight: (_) => setState(() {}),
//         child: transition(
//           Card(
//             elevation: node.hasFocus ? 10 : 4,
//             color: color,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(icon, color: Colors.white),
//                   const SizedBox(width: 10),
//                   Text(
//                     label,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _handleAction(String label) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('$label selected')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Stylish Bank UI"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             _buildAnimatedCard(
//               label: "Deposit Cash",
//               icon: Icons.attach_money,
//               color: Colors.green.shade600,
//               node: _focusNodes[0],
//               animation: _scaleCtrl,
//               onTap: () => _handleAction("Deposit"),
//               transition: (child) => ScaleTransition(
//                 scale: _scaleCtrl,
//                 child: child,
//               ),
//             ),
//             const SizedBox(height: 15),
//             _buildAnimatedCard(
//               label: "Withdraw ATM",
//               icon: Icons.atm,
//               color: Colors.orange.shade800,
//               node: _focusNodes[1],
//               animation: _rotateCtrl,
//               onTap: () => _handleAction("Withdraw"),
//               transition: (child) => RotationTransition(
//                 turns: _rotateCtrl,
//                 child: child,
//               ),
//             ),
//             const SizedBox(height: 15),
//             _buildAnimatedCard(
//               label: "Passbook",
//               icon: Icons.book,
//               color: Colors.blue.shade700,
//               node: _focusNodes[2],
//               animation: _fadeCtrl,
//               onTap: () => _handleAction("Passbook"),
//               transition: (child) => FadeTransition(
//                 opacity: _fadeCtrl,
//                 child: child,
//               ),
//             ),
//             const SizedBox(height: 15),
//             _buildAnimatedCard(
//               label: "Check Balance",
//               icon: Icons.account_balance,
//               color: Colors.purple.shade700,
//               node: _focusNodes[3],
//               animation: _slideCtrl,
//               onTap: () => _handleAction("Balance"),
//               transition: (child) => SlideTransition(
//                 position: Tween<Offset>(
//                   begin: const Offset(-1, 0),
//                   end: Offset.zero,
//                 ).animate(CurvedAnimation(
//                   parent: _slideCtrl,
//                   curve: Curves.easeOut,
//                 )),
//                 child: child,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

// void main() => runApp(const BankAnimatedUI());

class BankAnimatedUI extends StatelessWidget {
  const BankAnimatedUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Bank UI',
      debugShowCheckedModeBanner: false,
      home: const BankHomePage(),
    );
  }
}

class BankHomePage extends StatefulWidget {
  const BankHomePage({super.key});

  @override
  State<BankHomePage> createState() => _BankHomePageState();
}

class _BankHomePageState extends State<BankHomePage> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  // Track button press states for animation triggers
  List<bool> _pressed = [false, false, false, false];

  void _triggerAnimation(int index) {
    setState(() {
      _pressed[index] = true;
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _pressed[index] = false;
      });
    });
  }

  Widget _buildAnimatedCard({
    required String label,
    required IconData icon,
    required Color color,
    required int index,
    required void Function() onTap,
  }) {
    final isPressed = _pressed[index];

    return GestureDetector(
      onTap: () {
        _triggerAnimation(index);
        onTap();
      },
      child: FocusableActionDetector(
        focusNode: _focusNodes[index],
        onShowFocusHighlight: (_) => setState(() {}),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
    transform: (isPressed
        ? (index % 2 == 0
            ? (Matrix4.identity()..scale(0.95))
            : (Matrix4.identity()..translate(0, -5)))
        : Matrix4.identity()),
          child: Card(
            elevation: _focusNodes[index].hasFocus ? 10 : 4,
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleAction(String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label selected')),
    );
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stylish Bank UI"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildAnimatedCard(
              label: "Deposit Cash",
              icon: Icons.attach_money,
              color: Colors.green.shade600,
              index: 0,
              onTap: () => _handleAction("Deposit"),
            ),
            const SizedBox(height: 15),
            _buildAnimatedCard(
              label: "Withdraw ATM",
              icon: Icons.atm,
              color: Colors.orange.shade800,
              index: 1,
              onTap: () => _handleAction("Withdraw"),
            ),
            const SizedBox(height: 15),
            _buildAnimatedCard(
              label: "Passbook",
              icon: Icons.book,
              color: Colors.blue.shade700,
              index: 2,
              onTap: () => _handleAction("Passbook"),
            ),
            const SizedBox(height: 15),
            _buildAnimatedCard(
              label: "Check Balance",
              icon: Icons.account_balance,
              color: Colors.purple.shade700,
              index: 3,
              onTap: () => _handleAction("Balance"),
            ),
          ],
        ),
      ),
    );
  }
}
