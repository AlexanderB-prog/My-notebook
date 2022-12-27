import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notebook/pages/start_page/start_page.dart';
import 'package:notebook/pages/todo/history_page/history_widget.dart';
import 'package:notebook/pages/todo/todo_page/todo_add_page/todo_add_page.dart';
import 'package:notebook/pages/todo/todo_page/todo_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BAO Notebook',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.blueGrey,
          selectedItemColor: Colors.white,
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const StartPage(),
        '/todo_page': (context) =>  const TodoPage(),
        '/todo_page/history_page': (context) =>  const HistoryPage(),
        '/todo_page/todo_add_page': (context) => const TodoAddPageWidget(),
      },
    );
  }
}
