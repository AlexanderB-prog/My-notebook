import 'package:flutter/material.dart';
import 'package:notebook/pages/start_page/start_page.dart';
import 'package:notebook/pages/todo/history_page/history_widget.dart';
import 'package:notebook/pages/todo/todo_page/todo_add_page/todo_add_page.dart';
import 'package:notebook/pages/todo/todo_page/todo_page.dart';

abstract class Screens {
  static const main = '/';
  static const todoPage = '/todo_page';
  static const historyPage = '/todo_page/history_page';
  static const addPage = '/todo_page/todo_add_page';
}


class MainNavigation {
  Map<String, WidgetBuilder> get routes => {
    Screens.main: (context) => const StartPage(),
    Screens.todoPage: (context) => const TodoPage(),
    Screens.historyPage: (context) => const HistoryPage(),
    Screens.addPage: (context) => const TodoAddPageWidget(),
  };

}

