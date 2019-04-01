import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final appName="Custom Theme";
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600]
      ),
      home: MyHomePage(
        title:appName
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key,@required this.title}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          //Theme.of(context)将查找Widget树并返回树中最近的Theme。
          //如果我们的Widget之上有一个单独的Theme定义，则返回该值。如果不是，则返回App主题。
          color: Theme.of(context).accentColor,
          child: Text(
            'Text with a background color',
            style:Theme.of(context).textTheme.title
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}