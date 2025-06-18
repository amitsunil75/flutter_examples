import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


/// The top-level widget of the app.
class CutCopyPasteExampleFlutter extends StatelessWidget {
  const CutCopyPasteExampleFlutter({super.key});

  static const String title = 'Shortcuts and Actions Demo';

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.escape): const ClearIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyC): const CopyIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyA): const SelectAllIntent(),
      },
      child: const CopyableTextField(title: title),
    );
  }
}

/// A widget that contains a TextField and copy/select buttons.
class CopyableTextField extends StatefulWidget {
  const CopyableTextField({super.key, required this.title});

  final String title;

  @override
  State<CopyableTextField> createState() => _CopyableTextFieldState();
}

class _CopyableTextFieldState extends State<CopyableTextField> {
  late final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      dispatcher: LoggingActionDispatcher(),
      actions: <Type, Action<Intent>>{
        ClearIntent: ClearAction(controller),
        CopyIntent: CopyAction(controller),
        SelectAllIntent: SelectAllAction(controller),
      },
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: <Widget>[
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: controller,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Type something...',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.copy),
                      tooltip: 'Copy selected text',
                      onPressed: Actions.handler<CopyIntent>(
                        context,
                        const CopyIntent(),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.select_all),
                      tooltip: 'Select all text',
                      onPressed: Actions.handler<SelectAllIntent>(
                        context,
                        const SelectAllIntent(),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      tooltip: 'Clear all text',
                      onPressed: Actions.handler<ClearIntent>(
                        context,
                        const ClearIntent(),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ShortcutManager that logs shortcut handling.
class LoggingShortcutManager extends ShortcutManager {
  @override
  KeyEventResult handleKeypress(BuildContext context, KeyEvent event) {
    final KeyEventResult result = super.handleKeypress(context, event);
    if (result == KeyEventResult.handled) {
      debugPrint('Handled shortcut $event in $context');
    }
    return result;
  }
}

/// ActionDispatcher that logs which actions are invoked.
class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    debugPrint('Action invoked: $action($intent) from $context');
    return super.invokeAction(action, intent, context);
  }
}

/// Intent to clear the text field.
class ClearIntent extends Intent {
  const ClearIntent();
}

/// Action to clear the controller text.
class ClearAction extends Action<ClearIntent> {
  ClearAction(this.controller);
  final TextEditingController controller;

  @override
  Object? invoke(covariant ClearIntent intent) {
    controller.clear();
    return null;
  }
}

/// Intent to copy selected text.
class CopyIntent extends Intent {
  const CopyIntent();
}

/// Action to copy selected text to clipboard.
class CopyAction extends Action<CopyIntent> {
  CopyAction(this.controller);
  final TextEditingController controller;

  @override
  Object? invoke(covariant CopyIntent intent) {
    if (controller.selection.isValid) {
      final selectedText = controller.text.substring(
        controller.selection.start,
        controller.selection.end,
      );
      Clipboard.setData(ClipboardData(text: selectedText));
    }
    return null;
  }
}

/// Intent to select all text.
class SelectAllIntent extends Intent {
  const SelectAllIntent();
}

/// Action to select all text.
class SelectAllAction extends Action<SelectAllIntent> {
  SelectAllAction(this.controller);
  final TextEditingController controller;

  @override
  Object? invoke(covariant SelectAllIntent intent) {
    controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: controller.text.length,
    );
    return null;
  }
}
