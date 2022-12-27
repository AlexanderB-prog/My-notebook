import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class PopupMenuWidgetModel extends ChangeNotifier {
  var _todoList = <String>[];
  List<String> get todoList => _todoList.toList();

  PopupMenuWidgetModel() {
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
  


  Future<void> basicTodoList() async {
    var todoBox = await Hive.openBox<String>('box_for_todo');
    var todoList = <String>[
      'Добавить сохранение в базу',
      'Добавить воможность редактирования',
      'Добавить проверку на введение пустого текста. Готово.',
      'Создать калькулятор',
      'Добавить историю',
      'добавить календарь',
      'Доабвить возможсть выбирать цвет',
      'Возможность прокидывать дела в календарь на телефон',
      'Добавить авторизацию',
      'Добавить синхронизацию между устройствами под одной авторизацией',
      'Добавть позвможность менять местами дела в списке',
      // '',
      // '',
      // '',
      // ''
    ];
    for (var element in todoList) {todoBox.add(element); }
  }

  Future<void> deleteTodoList() async {
    var todoBox = await Hive.openBox<String>('box_for_todo');
    var historyBox = await Hive.openBox<String>('box_for_todo_history');
    List<String> deleteItems = todoBox.values.toList();
    historyBox.addAll(deleteItems);
    await todoBox.compact();
    await todoBox.clear();
  }

  Future<void> clearHistory() async {
    var historyBox = await Hive.openBox<String>('box_for_todo_history');
    await historyBox.compact();
    await historyBox.clear();
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

class PopupMenuWidgetModelProvider extends InheritedNotifier {
  final PopupMenuWidgetModel model;

  const PopupMenuWidgetModelProvider({
    Key? key,
    required Widget child,
    required this.model,
  }) : super(
    key: key,
    notifier: model,
    child: child,
  );

  static PopupMenuWidgetModelProvider of(BuildContext context) {
    final PopupMenuWidgetModelProvider? result =
    context.dependOnInheritedWidgetOfExactType<PopupMenuWidgetModelProvider>();
    assert(result != null, 'No TodoWidgetModelProvider found in context');
    return result!;
  }
}