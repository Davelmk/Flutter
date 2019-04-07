import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tabs"),
            backgroundColor: Colors.green,
            bottom: TabBar(
              //tab图标颜色
              labelColor: Colors.red,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_bus)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              // Icon(Icons.directions_car),
              Center(child:Text("Car")),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bus),
            ],
          ),
        ),
      ),
    );
  }
}