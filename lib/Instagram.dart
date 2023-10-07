import 'package:flutter/material.dart';

class Instagram extends StatefulWidget {
  @override InstagramState createState() => InstagramState();
}

class InstagramState extends State<Instagram> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text('InstagramDemoApp',
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
