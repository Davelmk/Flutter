import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "welcome",
      home:Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body:Center(
          
        )
      ),
    );
  }
}