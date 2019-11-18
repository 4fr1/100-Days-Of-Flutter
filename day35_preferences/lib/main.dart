import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  final CounterStorage _storage = CounterStorage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget._storage.readCounter().then((counter) {
      setState(() {
        _counter = counter;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _counter++;
            });
            widget._storage.writeCounter(_counter);
          },
        ),
        body: Center(child: Text(_counter.toString())));
  }
}

class CounterStorage {
  static const String COUNTER_KEY = "counter";

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  Future writeCounter(int counter) async {
    final prefs = await _prefs;
    prefs.setInt(COUNTER_KEY, counter);
  }

  Future<int> readCounter() async {
    final prefs = await _prefs;
    return prefs.getInt(COUNTER_KEY) ?? 0;
  }
}
