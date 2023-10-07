import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override TodoState createState() => TodoState();
}

class TodoState extends State<Todo> {

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
