import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notebook/api_service/data_service/data_service.dart';


class TodoWidgetModel extends ChangeNotifier {
  late final Future<Box<String>> _todoBox;
  var _todoList = <String>[];
  List<String> get todoList => _todoList.toList();
  TodoWidgetModel() {
    _setup();
  }

  void _setup() async {
    _todoBox =  DataService.instance.openTodoBox();
    _todoList = (await _todoBox).values.toList();
    notifyListeners();
    (await _todoBox).listenable().addListener(() async {
      _todoList = (await _todoBox).values.toList();
      notifyListeners();
    });
  }


  Future<void> todoDelete(int value) async {
    var historyBox = await DataService.instance.openHistoryBox();
    String deleteItem = (await _todoBox).getAt(value)!;
    historyBox.add(deleteItem);
    DataService.instance.closeBox(historyBox);
    (await _todoBox).deleteAt(value);
  }

  @override
  void dispose() async {
    DataService.instance.closeBox(await _todoBox);
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
