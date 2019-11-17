import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Returning Data Demo")),
        body: Center(child: SelectionButton()));
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          _navigateAndDisplaySelection(context);
        },
        child: Text('Pick an option!'));
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final String result = await Navigator.push(
        context, MaterialPageRoute(builder: (_) => EnterTextScreen()));
    Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(result)));
  }
}

class EnterTextScreen extends StatefulWidget {
  @override
  _EnterTextScreenState createState() => _EnterTextScreenState();
}

class _EnterTextScreenState extends State<EnterTextScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, _controller.text);
        return Future<bool>.value(false);
      },
      child: Scaffold(body: Center(child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: TextField(controller: _controller),
      ))),
    );
  }
}
