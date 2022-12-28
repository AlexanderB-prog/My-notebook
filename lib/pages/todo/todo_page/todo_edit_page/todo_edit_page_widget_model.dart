import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoEditPageWidgetModel extends ChangeNotifier {
  var _todoList = <String>[];
TodoEditPageWidgetModel(){
  _setup();

}

  void _setup() async {
    var todoBox = await Hive.openBox<String>('box_for_todo');
    _todoList = todoBox.values.toList();
  }

  String onEdit(int index) {

    return _todoList[index];
  }


}

class TodoEditPageWidgetModelProvider extends InheritedNotifier {
  final TodoEditPageWidgetModel model;

  const TodoEditPageWidgetModelProvider({
    Key? key,
    required Widget child,
    required this.model,
  }) : super(
    key: key,
    notifier: model,
    child: child,
  );

  static TodoEditPageWidgetModelProvider of(BuildContext context) {
    final TodoEditPageWidgetModelProvider? result =
    context.dependOnInheritedWidgetOfExactType<TodoEditPageWidgetModelProvider>();
    assert(result != null, 'No TodoWidgetModelProvider found in context');
    return result!;
  }
}
