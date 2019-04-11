import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Named Route",
      // initialRoute与home属性不可同时存在
      initialRoute: "/",
      routes: {
        "/":(context)=>FirstScren(),
        "/second":(context)=>SecondScreen(),
      },
    );
  }
}

class FirstScren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Go to Second"),
          onPressed: (){
            Navigator.pushNamed(context, "/second");
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Back to First"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}