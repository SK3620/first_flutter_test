import 'package:flutter/material.dart';
import 'second_page.dart';

// リスト一覧画面用Widget
class ToDoListPage extends StatelessWidget {
  String nameText = '';

  @override
  Widget build(BuildContext context) {
    // Scaffoldには、appBarとbodyプロパティが用意されてる
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('My Todo App'),
      ),
      body: Center(
        child: Text('リスト画面一覧'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // "push"画面で新規画面に遷移
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return SecondPage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
