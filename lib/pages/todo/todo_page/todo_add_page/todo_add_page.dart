import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodoAddPageWidget extends StatefulWidget {
  const TodoAddPageWidget({Key? key}) : super(key: key);

  @override
  State<TodoAddPageWidget> createState() => _TodoAddPageWidgetState();
}

class _TodoAddPageWidgetState extends State<TodoAddPageWidget> {
  final _newDoController = TextEditingController();

  @override
  void dispose() {
    _newDoController.dispose();

    super.dispose();
  }

  void _onSubmitted(String text) async {
    if (text == '') return;
    var todoBox = await Hive.openBox<String>('box_for_todo');
    await todoBox.add(text);
  }

  void _todoSave(BuildContext context, String value) async {
    if (value == '') return;
    var todoBox = await Hive.openBox<String>('box_for_todo');
    await todoBox.add(value);

  }




  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                _todoSave(context, text);
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
            _onSubmitted(_newDoController.text);
            context.findRootAncestorStateOfType()?.setState(() {});
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
