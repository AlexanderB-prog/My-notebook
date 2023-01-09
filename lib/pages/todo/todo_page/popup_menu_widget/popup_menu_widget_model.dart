import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notebook/api_service/data_service/data_service.dart';

class PopupMenuWidgetModel extends ChangeNotifier {
  var _todoList = <String>[];

  List<String> get todoList => _todoList.toList();

  PopupMenuWidgetModel() {
    _setup();
  }

  void _setup() async {
    var todoBox = await DataService.instance.openTodoBox();
    _todoList = todoBox.values.toList();
    notifyListeners();
    todoBox.listenable().addListener(() {
      _todoList = todoBox.values.toList();
      notifyListeners();
    });
  }

  Future<void> basicTodoList() async {
    var todoBox = await DataService.instance.openTodoBox();
    var todoList = <String>[
      //'Добавить сохранение в базу',
      'Добавить воможность редактирования',
      //'Добавить проверку на введение пустого текста. Готово.',
      //'Добавить историю',
      'добавить календарь',
      'Доабвить возможсть выбирать цвет',
      'Возможность прокидывать дела в календарь на телефон',
      'Добавить авторизацию',
      'Добавить синхронизацию между устройствами под одной авторизацией',
      'Добавть позвможность менять местами дела в списке',
      'Добавить примечание или под задачи',
      'Добавить статус дела',
      // '',
      // ''
    ];
    for (var element in todoList) {
      todoBox.add(element);
    }
  }

  Future<void> deleteTodoList() async {
    var todoBox = await DataService.instance.openTodoBox();
    var historyBox = await DataService.instance.openHistoryBox();
    List<String> deleteItems = todoBox.values.toList();
    historyBox.addAll(deleteItems);
    await todoBox.clear();
    await todoBox.compact();
  }

  Future<void> clearHistory() async {
    var historyBox = await DataService.instance.openHistoryBox();
    await historyBox.clear();
    await historyBox.compact();
  }

  @override
  Future<void> dispose() async {
    DataService.instance.closeBox(await DataService.instance.openTodoBox());
    DataService.instance.closeBox(await DataService.instance.openHistoryBox());
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
    final PopupMenuWidgetModelProvider? result = context
        .dependOnInheritedWidgetOfExactType<PopupMenuWidgetModelProvider>();
    assert(result != null, 'No TodoWidgetModelProvider found in context');
    return result!;
  }
}
