import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      title: "welcome",
      home:Scaffold(
        body: Center(
          child: Container(
            child: new Text('Hello World',style:TextStyle(fontSize:30.0)),
            alignment: Alignment.center,
            width: 500.0,
            height: 400.0,
            color: Colors.lightBlue,
            //内边距
            padding: const EdgeInsets.all(10.0),
            // padding:const EdgeInsets.fromLTRB(left, top, right, bottom)
            //外边距
            margin: const EdgeInsets.all(10.0),
            // margin:const EdgeInsets.fromLTRB(left, top, right, bottom)
            decoration: new BoxDecoration(
              //渐变背景
              gradient: const LinearGradient(
                colors: [Colors.lightBlue,Colors.green,Colors.purple]
              ),
              //边框
              border: Border.all(
                width: 2.0,
                color: Colors.red
              )
            ),
          ),
        ),
      ),
    );
  }
}