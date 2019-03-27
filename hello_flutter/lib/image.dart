import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      title: "welcome",
      home:Scaffold(
        body: Center(
          child: Container(
            child: new Image.network(
              'url',
              //以图片尺寸等比缩放，尽量充满容器
              fit: BoxFit.contain,  
              //拉伸图片，填满容器
              // fit:BoxFit.fill
              //以容器宽或者高为基准，填满容器的宽或者高
              // fit:BoxFit.fitWidth
              // fit:BoxFit.fitHeight
              //图片等比缩放，填满容器
              // fit:BoxFit.cover
              //为图片填充颜色
              color: Colors.green,
              colorBlendMode: BlendMode.darken,
              //重复
              repeat: ImageRepeat.repeat,
              //图片横向或者纵向重复填充容器
              // repeat:ImageRepeat.repeatX,
              // repeat:ImageRepeat.repeatY,
            ),
            // child: new Image.asset(name),
            // child: new Image.file(file),
            // child: new Image.memory(bytes),
            width: 300.0,
            height: 200.0,
            color:Colors.lightBlue,
          ),
        ),
      ),
    );
  }
}