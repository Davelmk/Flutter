import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final List<String> items;
  MyApp({Key key,@required this.items}):super(key:key);
  @override
  Widget build(BuildContext context) {
    final title="Long List";
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text("${items[index]}"),
            );
          },
        ),
      ),
    );
  }
}