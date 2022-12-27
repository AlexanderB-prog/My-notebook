import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle styleElevatedButton = ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Приложение для работы'),
      ),
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/todo_list_planner.jpg'),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: styleElevatedButton,
            onPressed: () {
              Navigator.pushNamed(context, '/todo_page');
            },
            child: Row(
              children: const [
                Icon(Icons.list),
                SizedBox(width: 10),
                Expanded(child: Text('Список дел')),
                Icon(Icons.chevron_right)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
