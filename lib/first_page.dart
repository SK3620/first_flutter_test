import 'package:flutter/material.dart';
import 'second_page.dart';

class ToDoListPage extends StatefulWidget {
@override
ToDoListPageState createState() => ToDoListPageState();
}

// リスト一覧画面用Widget
class ToDoListPageState extends State<ToDoListPage> {

  List<String> toDoList = [];

  @override
  Widget build(BuildContext context) {
    // Scaffoldには、appBarとbodyプロパティが用意されてる
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('リスト一覧'),
      ),
      body: ListView.builder(
        itemCount: this.toDoList.length,
        // itemBuilderはType: Widget? Function(BuildContext, int)
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(this.toDoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return ToDoAddPage();
            }),
          );
          if (newListText != null) {
            // キャンセルした場合は newListText が null となるので注意
            setState(() {
              // リスト追加
              toDoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
