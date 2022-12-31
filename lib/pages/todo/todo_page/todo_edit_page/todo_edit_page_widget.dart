import 'package:flutter/material.dart';
import 'package:notebook/pages/todo/todo_page/todo_edit_page/todo_edit_page_widget_model.dart';

class TodoEditPageWidget extends StatefulWidget {
  final String todoText;
  final int todoIndex;
   const TodoEditPageWidget({Key? key, required this.todoText,required this.todoIndex,}) : super(key: key);

  @override
  State<TodoEditPageWidget> createState() => _TodoEditPageWidgetState();
}

class _TodoEditPageWidgetState extends State<TodoEditPageWidget> {
  final _newDoController = TextEditingController();

  final _model = TodoEditPageWidgetModel();


  @override
  void dispose() {
    _newDoController.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    _newDoController.text=widget.todoText;
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: Container(
        width: 250,
        color: Colors.white,
        child: TextField(
            autofocus: true,
            maxLines: null,
            minLines: 2,
            decoration: const InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(),
            ),
            controller: _newDoController,
            ),
      ),
      actions: [
        // const DropdownButtonWidget(),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            _newDoController.clear();
          },
          child: const Text('Назад'),
        ),
        TextButton(
          onPressed: () {
           _model.onSubmitted(_newDoController.text,widget.todoIndex);
            Navigator.pop(context);
          },
          child: const Text('Добавить'),
        ),
      ],
    );
  }
}
