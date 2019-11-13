import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:day1_introduction/main.dart' as app;

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  runApp(
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(body: Center(child: Text("HELLO", key: Key("hi")))),
      )
  );
}