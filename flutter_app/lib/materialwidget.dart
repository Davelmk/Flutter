import 'package:flutter/material.dart';
import './gesture.dart';
import './statefulwidget.dart';

//material组件
class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //AppBar图标
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: "Navigation menu",
          onPressed: (){
              print("Menu");
            },
        ),
        title: Text("Example Title"),
        //AppBar尾部图标按钮
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: (){
              print("Search");
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          MyButton(),
          Counter()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "add",
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}