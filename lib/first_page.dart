import 'package:flutter/material.dart';
import 'second_page.dart';

class FirstPage extends StatelessWidget {
  String nameText = '';

  @override
  Widget build(BuildContext context) {
    // Scaffoldには、appBarとbodyプロパティが用意されてる
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: text,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://picsum.photos/250?image=9'),
              TextField(
                onChanged: (text){
                  this.nameText = text;
                },
              ),
              ElevatedButton  (
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage(this.nameText)
                      )
                  );
                },
                child: const Text('ボタン'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final text = Text('FirstPage');

}
