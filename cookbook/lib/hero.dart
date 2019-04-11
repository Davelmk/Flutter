import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Transition",
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainScreen"),
      ),
      body: GestureDetector(
        child: Hero(
          tag: "imageHero",
          child: Image.network("https://picsum.photos/250?image=9"),
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (_){
              return DetailScreen();
            }
          ));
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DetailScreen"),
      ),
      body: GestureDetector(
        child:Center(
          child: Hero(
            tag: "imageHero",
            child: Image.network("https://picsum.photos/250?image=9"),
          ),
        ),
        onTap: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}