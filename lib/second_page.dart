import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('SecondPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name,
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            ElevatedButton (
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ボタン'),
            ),
          ],
        ),
      ),
    );
  }
}
