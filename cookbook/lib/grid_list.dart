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
        //横竖屏状态切换
        body: OrientationBuilder(
          builder: (context,orientation){
            return GridView.count(
              //竖屏2列，横屏3列
              crossAxisCount: orientation==Orientation.portrait ? 2 : 3,
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
            );
          },
        )
      ),
    );
  }
}