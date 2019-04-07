import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final appTitle="Drawer";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(appTitle:appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String appTitle;
  MyHomePage({Key key,@required this.appTitle}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: Text("HomePage"),
      ),
      drawer: Container(
        width: 280,
        color: Colors.grey,
        child: ListView(
        //移除ListView中所有的Padding
        //通知栏会遮挡
        // padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Drawer Header"),
            decoration: BoxDecoration(
              color: Colors.lightBlue
            ),
          ),
          ListTile(
            title: Text("Item 1"),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Item 2"),
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
      )
    );
  }
}
