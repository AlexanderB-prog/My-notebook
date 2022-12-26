import 'package:flutter/material.dart';
import 'history_widget_model.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _model = HistoryPageModel();

  @override
  void dispose() {
   // HistoryPageModelProvider.of(context).model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HistoryPageModelProvider(
      model: _model,
      child: const HistoryPageWidget(),
    );
  }
}

class HistoryPageWidget extends StatefulWidget {
  const HistoryPageWidget({Key? key}) : super(key: key);

  @override
  State<HistoryPageWidget> createState() => _HistoryPageWidgetState();
}

class _HistoryPageWidgetState extends State<HistoryPageWidget> {
  @override
  Widget build(BuildContext context) {
    final length = HistoryPageModelProvider.of(context).model.todoList.length;
    return Scaffold(

      body: ListView.builder(
          itemCount: length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Card(
                color: Colors.white,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text('${index + 1}.'),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Text(HistoryPageModelProvider.of(context)
                            .model
                            .todoList[index])),
                    const Icon(Icons.done),
                  ],
                ),
              ),
            );
          }),

    );
  }
}
