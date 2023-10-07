import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  @override NewPageState createState() => NewPageState();
}

class NewPageState extends State<NewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text('ToDoApp',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
      ),
      body: Container(
        // 余白をつける
      ),
    );
  }
}

