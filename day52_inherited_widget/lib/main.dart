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
      home: Home(),
    );
  }
}

class NameContainer extends InheritedWidget {
  final String name;

  NameContainer(this.name, {Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(NameContainer oldWidget) => oldWidget.name != name;

  static NameContainer of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(NameContainer) as NameContainer;
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NameContainer(
      "Franz",
      child: Scaffold(
        body: NewWidget()
      )
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(NameContainer.of(context).name))
    );
  }
}

