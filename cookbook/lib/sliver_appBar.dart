import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  //???
  MyApp({Key key}):super(key :key);
  @override
  Widget build(BuildContext context) {
    final title="Floating AppBar";
    return MaterialApp(
      title: title,
      home:Scaffold(
        body:CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(title),
              floating: true,
              flexibleSpace: Placeholder(),
              expandedHeight: 56,
            ),
            //SliverGrid
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context,index)=>ListTile(title: Text("Item $index")),
                childCount: 1000
              ),
            )
          ],
        )
      )
    );
  }
}