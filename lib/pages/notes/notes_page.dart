import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Заметки',style: TextStyle(fontSize: 30),),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.menu))
        ],
      ),
      body: ListView(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            NoteRollWidget(),
            NoteRollWidget(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            NoteRollWidget(),
            NoteRollWidget(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            NoteRollWidget(),
            NoteRollWidget(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            NoteRollWidget(),
            NoteRollWidget(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            NoteRollWidget(),
            NoteRollWidget(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            NoteRollWidget(),
            NoteRollWidget(),
          ],
        ),
      ]),
    );
  }
}

class NoteRollWidget extends StatelessWidget {
  const NoteRollWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150,
      width: 150,
      child: Card(
        color: Colors.green,
        child: Center(child: Text('В разработке')),
      ),
    );
  }
}
