import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Center(child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a search term'
            ),
          ))
      ),
    );
  }
}
