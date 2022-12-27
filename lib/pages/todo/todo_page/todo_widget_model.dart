import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoWidgetModel extends ChangeNotifier {
  var _todoList = <String>[];
  List<String> get todoList => _todoList.toList();

  TodoWidgetModel() {
    _setup();
  }

  void _setup() async {
    var todoBox = await Hive.openBox<String>('box_for_todo');
    _todoList = todoBox.values.toList();
    notifyListeners();
    todoBox.listenable().addListener(() {
      _todoList = todoBox.values.toList();
      notifyListeners();
    });
  }


  Future<void> todoDelete(int value) async {
    var todoBox = await Hive.openBox<String>('box_for_todo');
    var historyBox = await Hive.openBox<String>('box_for_todo_history');
     String deleteItem = todoBox.getAt(value)!;
    historyBox.add(deleteItem);
    todoBox.deleteAt(value);
  }


@override
  void dispose() async {
  await Hive.box('box_for_todo').compact();
  await Hive.box('box_for_todo').close();
  await Hive.box('box_for_todo_history').compact();
  await Hive.box('box_for_todo_history').close();
    super.dispose();
  }
}

class TodoWidgetModelProvider extends InheritedNotifier {
  final TodoWidgetModel model;

  const TodoWidgetModelProvider({
    Key? key,
    required Widget child,
    required this.model,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static TodoWidgetModelProvider of(BuildContext context) {
    final TodoWidgetModelProvider? result =
        context.dependOnInheritedWidgetOfExactType<TodoWidgetModelProvider>();
    assert(result != null, 'No TodoWidgetModelProvider found in context');
    return result!;
  }
}
