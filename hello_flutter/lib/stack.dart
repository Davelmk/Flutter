import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    var stack=new Stack(
      //根据坐标进行对齐
      //参数：0~1
      alignment: const FractionalOffset(0.5, 0.8),
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage("url"),
          radius: 100.0,
        ),
        Container(
          child: Text("data"),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        )
      ],
    );

    return MaterialApp(
      title: "welcome",
      home:Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body:Center(
          child: stack,
        )
      ),
    );
  }
}