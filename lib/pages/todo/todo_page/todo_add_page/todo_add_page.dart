import 'package:flutter/material.dart';
import 'package:notebook/pages/todo/todo_page/todo_add_page/todo_add_page_model.dart';

class TodoAddPageWidget extends StatefulWidget {
  const TodoAddPageWidget({Key? key}) : super(key: key);

  @override
  State<TodoAddPageWidget> createState() => _TodoAddPageWidgetState();
}

class _TodoAddPageWidgetState extends State<TodoAddPageWidget> {
  final _newDoController = TextEditingController();
  final _model = TodoAddPageModel();

  @override
  void dispose() {
    _newDoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TodoAddPageModelProvider(
      model: _model,
      child: AlertDialog(
        backgroundColor: Colors.grey[200],
        title: const Text('Добавить задачу'),
        content: Container(
          color: Colors.white,
          child: TextField(
              autofocus: true,
              maxLines: null,
              minLines: 1,
              decoration: const InputDecoration(
                hintText: 'Задача',
                isCollapsed: true,
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(),
              ),
              controller: _newDoController,
              onSubmitted: (text) {
                if (text != '') {
                  _model.todoSave(context, text);
                  _newDoController.clear();
                }
                Navigator.pop(context);
              }),
        ),
        actions: [
          // const DropdownButtonWidget(),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _newDoController.clear();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _model.onSubmitted(_newDoController.text);
              context.findRootAncestorStateOfType()?.setState(() {});
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
