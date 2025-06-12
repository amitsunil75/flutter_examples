import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrunchCoFancyAlert extends StatefulWidget {
  const CrunchCoFancyAlert({super.key});

  @override
  State<CrunchCoFancyAlert> createState() => _CrunchCoFancyAlertState();
}

class _CrunchCoFancyAlertState extends State<CrunchCoFancyAlert> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  Widget adaptiveAction({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    final ThemeData theme = Theme.of(context);
    return theme.platform == TargetPlatform.iOS || theme.platform == TargetPlatform.macOS
        ? CupertinoDialogAction(onPressed: onPressed, child: child)
        : TextButton(onPressed: onPressed, child: child);
  }

  void _showStyledDialog(BuildContext context) {
    _controller.forward();
    showGeneralDialog(
      barrierLabel: 'CrunchCo Alert',
      barrierDismissible: true,
      context: context,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation1, animation2) {
        return SlideTransition(
          position: _offsetAnimation,
          child: AlertDialog(
            elevation: 20,
            backgroundColor: Colors.orange.shade50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
            actionsPadding: const EdgeInsets.only(bottom: 12, right: 12),
            title: Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.deepOrange.shade800),
                const SizedBox(width: 10),
                Text(
                  'Production Alert',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange.shade800,
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  '⚠️ Batch #245 may contain texture inconsistencies.',
                  style: TextStyle(color: Colors.brown.shade900, fontSize: 16),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.bar_chart, size: 20, color: Colors.deepOrange),
                    const SizedBox(width: 6),
                    Text(
                      'Error Rate: ',
                      style: TextStyle(color: Colors.brown.shade700),
                    ),
                    Text(
                      '4.8%',
                      style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Would you like to pause production and inspect?',
                  style: TextStyle(color: Colors.brown.shade800),
                ),
              ],
            ),
            actions: [
              adaptiveAction(
                context: context,
                onPressed: () => Navigator.pop(context),
                child: const Text('Ignore'),
              ),
              adaptiveAction(
                context: context,
                onPressed: () {
                  Navigator.pop(context);
                  // Add QA logic here
                },
                child: const Text(
                  'Run QA Check',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showStyledDialog(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          child: const Text('🚨 Show Alert'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
