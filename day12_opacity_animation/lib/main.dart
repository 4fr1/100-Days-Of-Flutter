import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
              tooltip: 'Toggle Opacity',
              child: Icon(Icons.flip),
            ),
            body: AnimatedOpacity(
              curve: Curves.ease,
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Center(
                  child:
                      Container(width: 200, height: 200, color: Colors.green)),
            )));
  }
}
