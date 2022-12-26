import 'package:flutter/material.dart';
import 'package:notebook/pages/todo/history_page/history_widget.dart';
import 'package:notebook/pages/todo/todo_page/popup_menu.dart';
import 'package:notebook/pages/todo/todo_page/todo_add_page/todo_add_page.dart';
import 'package:notebook/pages/todo/todo_page/todo_widget_model.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _model = TodoWidgetModel();

  @override
  void dispose() {
    //TodoWidgetModelProvider.of(context).model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TodoWidgetModelProvider(
      model: _model,
      child: const TodoPageWidget(),
    );
  }
}

class TodoPageWidget extends StatefulWidget {
  const TodoPageWidget({Key? key}) : super(key: key);

  @override
  State<TodoPageWidget> createState() => _TodoPageWidgetState();
}

class _TodoPageWidgetState extends State<TodoPageWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TodoListBodyWidget(),
        HistoryPage(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      if (_selectedIndex == index) return;
            _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список дел'),
        actions: const [
          PopupMenuWidget()
          // IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const TodoAddPageWidget();
                  });
            },
            child: const Icon(Icons.add_task),
          ),
          const SizedBox(width: 20,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Список дел',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_edu),
            label: 'История дел',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }


}


class TodoListBodyWidget extends StatelessWidget {
  const TodoListBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final length = TodoWidgetModelProvider.of(context).model.todoList.length;
    return ListView.builder(
        itemCount: length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.grey[200],
            child: Row(
              children: [
                const SizedBox(width: 10),
                Text('${index + 1}.'),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(TodoWidgetModelProvider.of(context)
                        .model
                        .todoList[index])),
                IconButton(
                    onPressed: () {
                      TodoWidgetModelProvider.of(context)
                          .model
                          .todoDelete(index);
                                            },
                    icon: const Icon(Icons.delete_forever))
              ],
            ),
          );
        });
  }
}
