import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notebook/pages/navigation/main_navigation.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final mainNavigation = MainNavigation();
  MyApp({Key? key}) : super(key: key);


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
      initialRoute: Screens.main,
      routes: mainNavigation.routes,
    );
  }
}
