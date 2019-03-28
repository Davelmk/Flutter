import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "导航演示",
      home: FirstScreen(),
    )
  );
}
//主页面（导航1）
class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("导航1"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("查看详情"),
          //点击跳转
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>SecondScreen()
            ));
          },
        ),
      ),
    );
  }
}

//第二个页面
//作为第一个页面的附属子页面
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("导航2-详情"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("返回"),
          onPressed: (){
            Navigator.pop(context); 
          },
        ),
      ),
    );
  }
}