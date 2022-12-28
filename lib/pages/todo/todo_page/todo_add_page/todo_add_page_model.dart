import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodoAddPageModel extends ChangeNotifier {
  void onSubmitted(String text) async {
    if (text == '') return;
    var todoBox = await Hive.openBox<String>('box_for_todo');
    await todoBox.add(text);
  }

  void todoSave(BuildContext context, String value) async {
    if (value == '') return;
    var todoBox = await Hive.openBox<String>('box_for_todo');
    await todoBox.add(value);
  }
}

class TodoAddPageModelProvider extends InheritedNotifier {
  final TodoAddPageModel model;

  const TodoAddPageModelProvider(
    {
      required this.model,
      Key? key,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static TodoAddPageModelProvider of(BuildContext context) {
    final TodoAddPageModelProvider? result =
        context.dependOnInheritedWidgetOfExactType<TodoAddPageModelProvider>();
    assert(result != null, 'No TodoAddPageModelProvider found in context');
    return result!;
  }
}
