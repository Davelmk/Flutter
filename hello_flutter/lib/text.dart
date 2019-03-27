import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "welcome",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter")
        ),
        body: Center(
          child: Text(
            "HelloWorld",
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.clip,
            //省略
            // overflow:TextOverflow.ellipsis
            //自上而下渐变
            // overflow:TextOverflow.fade
            style: TextStyle(
              fontSize: 25.0,
              color:Color.fromARGB(0, 0, 0, 0),
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}