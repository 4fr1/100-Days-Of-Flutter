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
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FocusNode _focusNode;


  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }


  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },),
        body: Center(
            child: Padding(
      padding: EdgeInsets.all(36),
      child: TextField(
       // autofocus: true,
        focusNode: _focusNode,
      ),
    )));
  }
}
