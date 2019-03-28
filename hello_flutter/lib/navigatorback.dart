import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "导航返回数据",
      home: FirstPage(),
    )
  );
}

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("页面1"),),
      body: Center(
        //自定义路由按钮
        child: RouterButton(),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面2"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("data1"),
              onPressed: (){
                Navigator.pop(context,"data1");
              },
            ),
            RaisedButton(
              child: Text("data2"),
              onPressed: (){
                Navigator.pop(context,"data2");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RouterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("跳转"),
      onPressed: (){
        //内部函数
        _navigator(context);
      },
    );
  }
}

_navigator(BuildContext context) async{
  //等待返回参数
  final result=await Navigator.push(
    context, 
    MaterialPageRoute(builder: (context)=>SecondPage())
  );
  //SnackBar展示返回数据
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content:Text("$result")
    )
  );
}