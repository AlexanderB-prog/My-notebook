import 'package:hive/hive.dart';

class DataApiService {
  var _todoList = <String>[];
  List<String> get todoList => _todoList.toList();

  Future<List<String>> setup() async {
    var todoBox = await Hive.openBox<String>('box_for_todo');
    _todoList = todoBox.values.toList();
    return _todoList;
  }


  Future<void> todoDelete(int value) async {
    var todoBox = await Hive.openBox<String>('box_for_todo');
    var historyBox = await Hive.openBox<String>('box_for_todo_history');
    String deleteItem = todoBox.getAt(value)!;
    historyBox.add(deleteItem);
    todoBox.deleteAt(value);
    _closeTodo();
    _closeHistory();
  }


  void _closeTodo() async {
    await Hive.box('box_for_todo').compact();
    await Hive.box('box_for_todo').close();
  }

  void _closeHistory() async {
    await Hive.box('box_for_todo_history').compact();
    await Hive.box('box_for_todo_history').close();
  }

}