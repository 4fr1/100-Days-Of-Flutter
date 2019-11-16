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
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                  bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.cake)),
                Tab(icon: Icon(Icons.vibration)),
                Tab(icon: Icon(Icons.backup)),
              ])),
              body: TabBarView(children: [
                Icon(Icons.cake),
                Icon(Icons.vibration),
                Icon(Icons.backup),
              ]))),
    );
  }
}
