import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      title: "welcome",
      home:Scaffold(
        appBar: new AppBar(
          title: new Text("ListView"),
        ),
        // body:MyList()
        body: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.book),
              title: new Text("Book"),
            ),
            new ListTile(
              leading: new Icon(Icons.add_circle),
              title: new Text("add_circle"),
            ),
          ],
        )
      ),
    );
  }
}

class MyList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListView(
      //列表横向滑动
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 100.0,
            color: Colors.green,
          ),
          Container(
            width: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            color: Colors.blueGrey,
          ),
          Container(
            width: 100.0,
            color: Colors.yellow,
          ),
          Container(
            width: 100.0,
            color: Colors.red,
          ),
          Container(
            width: 100.0,
            color: Colors.purple,
          ),
        ],
    );
  }
}