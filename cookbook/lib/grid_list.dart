import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GridList",
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridList"),
        ),
        body: GridView.count(
          //3列
          crossAxisCount: 3,
          children:List.generate(
            100, (index){
              return Container(
                margin: EdgeInsets.all(10.0),
                color: Colors.lightBlue,
                child: Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              );
            }
          )
        ),
      ),
    );
  }
}