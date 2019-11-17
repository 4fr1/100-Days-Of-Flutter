import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: HomeScreen.routeName,
        home: HomeScreen(),
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == ExtractArgumentsScreen.routeName) {
            return MaterialPageRoute(
                builder: (_) => ExtractArgumentsScreen(settings.arguments));
          }

          return MaterialPageRoute(
              builder: (_) => Scaffold(body: Center(child: Text("Error !!"))));
        });
  }
}

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      RaisedButton(
          child: Text("Go to ExtractArgumentsScreen"),
          onPressed: () {
            Navigator.pushNamed(context, ExtractArgumentsScreen.routeName,
                arguments: ScreenArguments('args', 'Secret message!!!!'));
          })
    ])));
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  final ScreenArguments screenArguments;

  ExtractArgumentsScreen(this.screenArguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(screenArguments.title)),
        body: Center(child: Text(screenArguments.message)));
  }
}
