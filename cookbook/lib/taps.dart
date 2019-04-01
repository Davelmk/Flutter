
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title="Gesture";
    return MaterialApp(
      title: title,
      home: HomePage(title: title)
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  HomePage({Key key,@required this.title}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //添加Material触摸水波效果
    return InkWell(
      onTap: (){
        print("Tap");
        final snackBar=new SnackBar(content: Text("Tap"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      onDoubleTap: (){
        print("Double Tap");
        Scaffold.of(context).hideCurrentSnackBar();
      },
      child: Container(
        width: 100.0,
        height: 60.0,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Center(
          child: Text("MyButton")
        ),
      ),
    );
  }
}