import 'dart:ffi';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(36.0),
      child: Center(child: CustomForm()),
    ));
  }
  
}

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            }),

            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text("Success!!")));
                          }
                        },
                        child: Text("Check")),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
