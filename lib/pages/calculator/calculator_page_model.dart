import 'package:flutter/material.dart';

class CalculatorPageWidget extends ChangeNotifier {
  String inputData = '';
  List<Widget> historyData = <Widget>[];
  String resultData = '=';
  String operation ='';
  double? firstNumber;
  double? secondNumber;

  void inputCulcButton(String text) {
    inputData = inputData + text;
    notifyListeners();
  }

  void inputActionButton(String text) {
    if (firstNumber == null) {
      firstNumber = double.parse(inputData);
      historyData.add(Text(inputData));
      historyData.add(Text(text));
      inputData = '';
      operation = text;
      notifyListeners();
      return;
    } else {
      secondNumber = double.parse(inputData);
      switch (operation) {
        case '+':
          resultData = (firstNumber! + secondNumber!).toString();
          historyData.add(Text(inputData));
          historyData.add(const Text('='));
          historyData.add(Text(resultData));
          historyData.add(Text(text));
          inputData = '';
          operation=text;
          firstNumber = double.parse(resultData);
          notifyListeners();
          break;
      }
    }
  }
}

class CalculatorPageWidgetProvider extends InheritedNotifier {
  final CalculatorPageWidget model;

  const CalculatorPageWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static CalculatorPageWidgetProvider of(BuildContext context) {
    final CalculatorPageWidgetProvider? result = context
        .dependOnInheritedWidgetOfExactType<CalculatorPageWidgetProvider>();
    assert(result != null, 'No CalculatorPageWidgetProvider found in context');
    return result!;
  }
}
