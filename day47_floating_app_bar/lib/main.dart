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
        home: Scaffold(
            body: CustomScrollView(slivers: [
          SliverAppBar(
              floating: true,
              flexibleSpace: Image.network("https://picsum.photos/id/866/536/354"),
              expandedHeight: 200),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Item #$index')),
                  childCount: 1000))
        ])));
  }
}
