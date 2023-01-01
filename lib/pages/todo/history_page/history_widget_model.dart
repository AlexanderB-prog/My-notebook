import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryPageModel extends ChangeNotifier {
  var _todoList = <String>[];

  List<String> get todoList => _todoList.toList();

  HistoryPageModel() {
    _setup();
  }

  void _setup() async {
    var historyBox = await Hive.openBox<String>('box_for_todo_history');
    _todoList = historyBox.values.toList();
    notifyListeners();
    historyBox.listenable().addListener(() {
      _todoList = historyBox.values.toList();
      notifyListeners();
    });
  }

  @override
  void dispose() async {
    await Hive.box('box_for_todo_history').compact();
    await Hive.box('box_for_todo_history').close();
    super.dispose();
  }
}

class HistoryPageModelProvider extends InheritedNotifier {
  final HistoryPageModel model;

  const HistoryPageModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static HistoryPageModelProvider of(BuildContext context) {
    final HistoryPageModelProvider? result =
        context.dependOnInheritedWidgetOfExactType<HistoryPageModelProvider>();
    assert(result != null, 'No HistoryPageModelProvider found in context');
    return result!;
  }
}
