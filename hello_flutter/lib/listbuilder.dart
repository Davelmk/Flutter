import 'package:flutter/material.dart';

void main() => runApp(MyApp(
  items:List<String>.generate(100, (i)=>"Item $i")
));

class MyApp extends StatelessWidget {

  final List<String> items;
  MyApp({Key key,@required this.items}):super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "welcome",
      home:Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body:ListView.builder(
          itemCount: items.length,
          itemBuilder:(context,index){
            return ListTile(
              title: Text('${items[index]}'),
              leading: Icon(Icons.account_box),  
            );
          },
        )
      ),
    );
  }
}