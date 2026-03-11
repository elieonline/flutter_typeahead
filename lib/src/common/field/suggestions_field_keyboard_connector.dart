import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility_plus/flutter_keyboard_visibility_plus.dart';
import 'package:flutter_typeahead/src/common/base/connector_widget.dart';
import 'package:flutter_typeahead/src/common/base/suggestions_controller.dart';

/// Hides the suggestions box when the keyboard is closed.
class SuggestionsFieldKeyboardConnector<T> extends StatelessWidget {
  const SuggestionsFieldKeyboardConnector({
    super.key,
    required this.controller,
    required this.child,
    this.hideWithKeyboard = true,
  });

  final SuggestionsController<T> controller;
  final Widget child;
  final bool hideWithKeyboard;

  @override
  Widget build(BuildContext context) {
    return ConnectorWidget(
      value: KeyboardVisibilityController(),
      connect: (value) => value.onChange.listen((status) {
        if (!status && hideWithKeyboard) {
          controller.close();
        }
      }),
      disconnect: (value, key) => key?.cancel(),
      child: child,
    );
  }
}
