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
        body:Row(
          children: <Widget>[
            RaisedButton(
              onPressed: (){},
              color: Colors.blue,
              child: Text("Button1"),
            ),
            //动态填充空间
            Expanded(
              child: RaisedButton(
                onPressed: (){},
                color: Colors.purple,
                child: Text("Button2"),
              ),
            ),
            RaisedButton(
              onPressed: (){},
              color: Colors.red,
              child: Text("Button3"),
            )
          ],
        )
      ),
    );
  }
}