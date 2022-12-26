import 'package:flutter/material.dart';
import 'package:notebook/pages/todo/todo_page/todo_widget_model.dart';

class PopupMenuWidget extends StatelessWidget {
  const PopupMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton(
        itemBuilder: (context) => [
           PopupMenuItem(
            value: 1,
            onTap: TodoWidgetModelProvider.of(context).model.basicTodoList,
            child: const Text("Добавить стандартные дела"),
          ),
          PopupMenuItem(
            value: 2,
            onTap: TodoWidgetModelProvider.of(context).model.deleteTodoList,
            child: const Text("Удалить все дела"),
          ),
          PopupMenuItem(
            value: 3,
            onTap: TodoWidgetModelProvider.of(context).model.clearHistory,
            child: const Text("Очистить историю"),
          )
        ]
    );
  }
}
