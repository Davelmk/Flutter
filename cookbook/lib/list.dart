import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title="Basic List";
    return new MaterialApp(
      title:title,
      home:Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text("map"),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text("photo"),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("phone"),
            )
          ],
        ),
      ),
    );
  }
}