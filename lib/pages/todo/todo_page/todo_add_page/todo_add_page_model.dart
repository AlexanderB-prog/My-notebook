import 'package:flutter/material.dart';

class TodoAddPageModel extends ChangeNotifier {



}

class TodoAddPageModelProvider extends InheritedNotifier {
  const TodoAddPageModelProvider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static TodoAddPageModelProvider of(BuildContext context) {
    final TodoAddPageModelProvider? result = context.dependOnInheritedWidgetOfExactType<TodoAddPageModelProvider>();
    assert(result != null, 'No TodoAddPageModelProvider found in context');
    return result!;
  }
}
