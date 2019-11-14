import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Page1()
  ));
}

class Page1 extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          child: Text('Go!'),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    // Route content
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    // Route animation
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Offset of 1 equals the translation of one screen width / height
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero; // = Offset(0,0)
      var curve = Curves.bounceIn;

      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    }
  );
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}