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
        // body:GridView.count(
        //   padding: const EdgeInsets.all(20.0),
        //   crossAxisSpacing:10.0,
        //   crossAxisCount: 3,
        //   children: <Widget>[
        //     const Text("data1"),
        //     const Text("data1"),
        //     const Text("data1"),
        //     const Text("data1"),
        //     const Text("data1"),
        //   ],
        // )
        body:GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //列数
            crossAxisCount: 3,
            //行间距
            mainAxisSpacing: 2.0,
            //列间距
            crossAxisSpacing: 2.0,
            //childAspectRatio=width/height
            childAspectRatio: 1
          ),
          children: <Widget>[
            Image.network("src",fit: BoxFit.cover),
            Image.network("src",fit: BoxFit.cover),
            Image.network("src",fit: BoxFit.cover),
            Image.network("src",fit: BoxFit.cover),
            Image.network("src",fit: BoxFit.cover),
            Image.network("src",fit: BoxFit.cover),
          ],
        )
      ),
    );
  }
}