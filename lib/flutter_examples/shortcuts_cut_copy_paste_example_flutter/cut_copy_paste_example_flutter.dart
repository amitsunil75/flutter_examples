import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CutCopyPasteExampleFlutter extends StatelessWidget {
  const CutCopyPasteExampleFlutter({super.key});

  static const String title = 'Shortcuts and Actions Demo';

  @override
  Widget build(BuildContext context) {
    return  Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.escape): const ClearIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyC):
              const CopyIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyA):
              const SelectAllIntent(),
        },
        child: const CopyableTextField(title: title),
      );
  }
}

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
          child: Row(
            children: <Widget>[
              const Spacer(),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: 'Enter text'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy),
                tooltip: 'Copy selected text',
                onPressed: () {
                  final handler = Actions.handler<CopyIntent>(
                    context,
                    CopyIntent(context: context),
                  );
                  if (handler != null) handler();
                },
              ),
              IconButton(
                icon: const Icon(Icons.select_all),
                tooltip: 'Select all text',
                onPressed: () {
                  final handler = Actions.handler<SelectAllIntent>(
                    context,
                    const SelectAllIntent(),
                  );
                  if (handler != null) handler();
                },
              ),
              IconButton(
                icon: const Icon(Icons.clear),
                tooltip: 'Clear text',
                onPressed: () {
                  final handler = Actions.handler<ClearIntent>(
                    context,
                    const ClearIntent(),
                  );
                  if (handler != null) handler();
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// -- Dispatcher and Shortcuts Logging --

class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    print('Action invoked: $action($intent) from $context');
    return super.invokeAction(action, intent, context);
  }
}

// -- Intents --

class ClearIntent extends Intent {
  const ClearIntent();
}

class CopyIntent extends Intent {
  const CopyIntent({this.context});
  final BuildContext? context;
}

class SelectAllIntent extends Intent {
  const SelectAllIntent();
}

// -- Actions --

class ClearAction extends Action<ClearIntent> {
  ClearAction(this.controller);
  final TextEditingController controller;

  @override
  Object? invoke(covariant ClearIntent intent) {
    controller.clear();
    return null;
  }
}

class CopyAction extends Action<CopyIntent> {
  CopyAction(this.controller);
  final TextEditingController controller;

  @override
  Object? invoke(covariant CopyIntent intent) {
    if (controller.selection.isValid &&
        controller.selection.start >= 0 &&
        controller.selection.end <= controller.text.length &&
        controller.selection.start != controller.selection.end) {
      final selectedText = controller.text.substring(
        controller.selection.start,
        controller.selection.end,
      );
      Clipboard.setData(ClipboardData(text: selectedText));

      // Show snackbar
      if (intent.context != null) {
        ScaffoldMessenger.of(intent.context!).showSnackBar(
          SnackBar(content: Text('Copied: "$selectedText"')),
        );
      }

      // Optional: Clear text after copying
      // controller.clear();
    } else {
      if (intent.context != null) {
        ScaffoldMessenger.of(intent.context!).showSnackBar(
          const SnackBar(content: Text('Please select some text to copy')),
        );
      }
    }
    return null;
  }
}

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
