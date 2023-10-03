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
        title: Text('リスト一覧'),
      ),
      body: ListView(
        children: <Widget> [
          Card(
            child: ListTile(
              title: Text('テスト1'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('テスト2'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('テスト3'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('テスト4'),
            ),
          ),
        ],
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
