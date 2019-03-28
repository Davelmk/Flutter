import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    var card=new Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "Card1",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("data1"),
            leading: Icon(Icons.account_box),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Card2",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("data2"),
            leading: Icon(Icons.account_box),
          ),
          Divider(),
        ],
      ),
    );
    return MaterialApp(
      title: "welcome",
      home:Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body:Center(
          child: card,
        )
      ),
    );
  }
}