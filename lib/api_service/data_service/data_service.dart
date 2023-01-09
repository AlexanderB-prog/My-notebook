import 'package:hive/hive.dart';

enum NameBox {todoBox,historyBox}

 class DataService {
static final DataService instance = DataService._();
DataService._();


  Future<Box<String>> _openBox(NameBox value) async {
    var box = await Hive.openBox<String>(value.toString());
    return box;
  }

  Future<Box<String>> openTodoBox() async {
    return _openBox(NameBox.todoBox);
  }
  Future<Box<String>> openHistoryBox() async {
    return _openBox(NameBox.historyBox);
  }


  Future<void> closeBox(Box<String> box) async {
    await box.compact();
    await box.close();
  }
  //
  // Future<Box<String>> _openTodo() async {
  //   return _openBox(NameBox.todoBox);
  // }
  // Future<Box<String>> _openHistory()async {
  //   return _openBox(NameBox.historyBox);
  // }
  //
  // void _closeTodo() {
  //   _closeBox(NameBox.todoBox);
  // }
  //
  // void _closeHistory() async {
  //   _closeBox(NameBox.historyBox);
  // }

  // Future<List<String>> setup() async {
  //   var todoBox = await _openTodo();
  //   _todoList = todoBox.values.toList();
  //   return _todoList;
  // }
  //
  //
  // Future<void> todoDelete(int value) async {
  //   var todoBox = await _openTodo();
  //   var historyBox = await _openHistory();
  //   String deleteItem = todoBox.getAt(value)!;
  //   historyBox.add(deleteItem);
  //   todoBox.deleteAt(value);
  //   _closeTodo();
  //   _closeHistory();
  // }

}