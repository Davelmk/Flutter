import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TextEditingController",
      home: MyHomePage(),
    );
  }
}

//MyHomPage需要return Scaffold
//直接return Padding会有call() null异常
//MyHomePage()放在home标签
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController=TextEditingController();
  @override
  void initState() {
    super.initState();
    myController.addListener(_textEditingListener());
  }
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  //TextField当前输入内容=myController.text
  _textEditingListener(){
    print("TextField 2:${myController.text}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextEditingController"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "TextField 1"
              ),
              onChanged: (text){
                print("TextField 1:$text");
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "TextField 2"
              ),
              controller: myController,
            )
          ],
        ),
      )
    );
  }
}