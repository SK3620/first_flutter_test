import 'package:flutter/material.dart';

class ToDoAddPage extends StatefulWidget {
  @override ToDoAddPageState createState() => ToDoAddPageState();
}

class ToDoAddPageState extends State<ToDoAddPage> {

  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('リスト追加'),
      ),
      body: Container(
        // 余白をつける
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            TextField(
              onChanged: (String value) {
                // データがが変更されたことを知らせる（画面を更新する）
                setState(() {
                  // データを変更
                  this.text = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              //リストボタン追加
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: (){
                  Navigator.of(context).pop(this.text);
                  print(this.text);
                },
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                child: Text('キャンセル'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
