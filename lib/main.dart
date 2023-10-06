import 'package:flutter/material.dart';
import 'first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//アプリの土台
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: GridViewDemo(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


/*
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.green,
      title: Text('Flutter'),
    ),
    body: Container(
        color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        child: Row (
          children: [
            Text('こんにちは'),
            Text('おはよう'),
            Container(width: 50, height: 50, color: Colors.grey, child: Center(child: Text('あ')),),
            Text('こんばんは'),
            Text('おやすみ'),
            Text('ただいま'),
          ],
        )
    ),
  );
}
*/
