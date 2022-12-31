import 'package:flutter/material.dart';
import 'package:notebook/pages/todo/todo_page/popup_menu_widget/popup_menu_widget_model.dart';

class PopupMenuWidget extends StatelessWidget {
  final _model = PopupMenuWidgetModel();
   PopupMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PopupMenuWidgetModelProvider(
      model: _model,
      child: PopupMenuButton(
          itemBuilder: (context) => [
             PopupMenuItem(
              value: 1,
              onTap: _model.basicTodoList,
              child: const Text("Добавить стандартные дела"),
            ),
            PopupMenuItem(
              value: 2,
              onTap: _model.deleteTodoList,
              child: const Text("Удалить все дела"),
            ),
            PopupMenuItem(
              value: 3,
              onTap: _model.clearHistory,
              child: const Text("Очистить историю"),
            )
          ]
      ),
    );
  }
}
