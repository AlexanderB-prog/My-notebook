import 'package:flutter/material.dart';
import 'package:notebook/pages/todo/todo_page/todo_edit_page/todo_edit_page_widget.dart';
import 'package:notebook/pages/todo/todo_page/todo_widget_model.dart';

class TodoPageWidget extends StatefulWidget {
  const TodoPageWidget({Key? key}) : super(key: key);

  @override
  State<TodoPageWidget> createState() => _TodoPageWidgetState();
}

class _TodoPageWidgetState extends State<TodoPageWidget> {
  final _model = TodoWidgetModel();


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TodoWidgetModelProvider(
      model: _model,
      child: const TodoListWidget(),
    );
  }
}

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({super.key});

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: TodoWidgetModelProvider.of(context).model.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          String text = TodoWidgetModelProvider.of(context).model.todoList[index];
          return GestureDetector(
            onTap: () {showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TodoEditPageWidget(todoText: text,);
                });},
            child: Container(
              //height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Card(
                color: Colors.grey[200],
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text('${index + 1}.'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          TodoWidgetModelProvider.of(context).model.todoDelete(index);
                        },
                        icon: const Icon(Icons.done_outline_rounded))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
