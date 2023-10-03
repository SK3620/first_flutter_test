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
      body: Container(
        width: double.infinity,
        child: ListView(
          children: <Widget> [
            ListTile(
              leading:  Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile (
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
      ),
    );
  }

  final text = Text('FirstPage');

}
