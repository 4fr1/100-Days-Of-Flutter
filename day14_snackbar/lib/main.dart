import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text('Snackbar')), body: SnackBarPage()),
    );
  }
}

class SnackBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SnackBarPageState();
}

class SnackBarPageState extends State<SnackBarPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
      child: Text("Show"),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('A snackbar'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
        ));
      },
    ));
  }
}
