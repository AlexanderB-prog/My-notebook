import 'package:flutter/material.dart';
import 'package:notebook/pages/todo/history_page/history_widget.dart';
import 'package:notebook/pages/todo/todo_page/popup_menu_widget.dart';
import 'package:notebook/pages/todo/todo_page/todo_add_page/todo_add_page.dart';
import 'package:notebook/pages/todo/todo_page/todo_widget.dart';


class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TodoPageWidget(),
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
        actions: [
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
          const SizedBox(
            width: 20,
          ),
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
