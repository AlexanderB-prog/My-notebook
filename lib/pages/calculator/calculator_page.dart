import 'package:flutter/material.dart';
import 'calculator_page_model.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = CalculatorPageWidget();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Калькулятор'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.menu))
        ],
      ),
      body: CalculatorPageWidgetProvider(
          model: model, child: const CalculatorBodyWidget()),
    );
  }
}

class CalculatorBodyWidget extends StatelessWidget {
  const CalculatorBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ResultCalculatorBodyWidget(),
        Divider(
          height: 3,
        ),
        InputCalculatorBodyWidget(),
        Divider(
          height: 3,
        ),
        KeyboardCalculatorBodyWidget(),
      ],
    );
  }
}

class ResultCalculatorBodyWidget extends StatelessWidget {
  const ResultCalculatorBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.bottomRight,
          color: Colors.grey,
          child: ListView.builder(

              itemCount: CalculatorPageWidgetProvider.of(context).model.historyData.length, itemBuilder: (BuildContext context, int index) {
            return CalculatorPageWidgetProvider.of(context).model.historyData[index];
          })

      ,),// Text(CalculatorPageWidgetProvider.of(context).model.historyData.toString(),textAlign: TextAlign.right),
    );
  }
}

class InputCalculatorBodyWidget extends StatelessWidget {
  const InputCalculatorBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                CalculatorPageWidgetProvider
                    .of(context)
                    .model
                    .inputData,
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                CalculatorPageWidgetProvider
                    .of(context)
                    .model
                    .resultData,
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class KeyboardCalculatorBodyWidget extends StatelessWidget {
  const KeyboardCalculatorBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CulcButton(text: '1'),
              CulcButton(text: '2'),
              CulcButton(text: '3'),
              ActionButton(text: '*',)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CulcButton(text: '4'),
              CulcButton(text: '5'),
              CulcButton(text: '6'),
              ActionButton(text: '/',)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CulcButton(text: '7'),
              CulcButton(text: '8'),
              CulcButton(text: '9'),
              ActionButton(text: ',',)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const ActionButton(text: '-',),
              const CulcButton(text: '0'),
              const ActionButton(text: '+',),
              TextButton(onPressed: () {}, child: const Text('='))
            ],
          )
        ],
      ),
    );
  }
}

class CulcButton extends StatelessWidget {
  final String text;

  const CulcButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () =>
        CalculatorPageWidgetProvider
            .of(context)
            .model
            .inputCulcButton(text),
        child: Text(text, style: const TextStyle(fontSize: 25),));
  }
}

class ActionButton extends StatelessWidget {
  final String text;

  const ActionButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () =>
        CalculatorPageWidgetProvider
            .of(context)
            .model
            .inputActionButton(text),
        child: Text(text, style: const TextStyle(
          fontSize: 20,
          color: Colors.deepOrange,
          fontWeight: FontWeight.w900,),));
  }
}