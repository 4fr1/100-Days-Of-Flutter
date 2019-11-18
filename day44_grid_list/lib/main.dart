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
        body: GridView.count(
          crossAxisCount: 5,
          children: List.generate(100, (index) {
            return Center(child: Text('Item $index', style: Theme.of(context).textTheme.headline));
          })
        )
      ),
    );
  }
}
