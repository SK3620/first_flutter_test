import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

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
            Text('こんにちは',
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
