import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notebook/api_service/data_service/data_service.dart';

class HistoryPageModel extends ChangeNotifier {
  var _todoList = <String>[];

  List<String> get todoList => _todoList.toList();

  HistoryPageModel() {
    _setup();
  }

  void _setup() async {
    var historyBox = await DataService.instance.openHistoryBox();
    _todoList = historyBox.values.toList();
    notifyListeners();
    historyBox.listenable().addListener(() {
      _todoList = historyBox.values.toList();
      notifyListeners();
    });
  }

  @override
  void dispose() async {
    DataService.instance.closeBox(await DataService.instance.openHistoryBox());
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
