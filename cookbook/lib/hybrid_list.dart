import 'package:flutter/material.dart';

abstract class ListItem{}

class HeadingItem implements ListItem{
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem implements ListItem{
  final String sender;
  final String body;
  MessageItem(this.sender,this.body);
}

final items=new List<ListItem>.generate(
  1200, 
  (i)=>i%6==0 ? new HeadingItem("Heading $i"):new MessageItem("Sender $i", "Message body $i")
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hybrid List",
      home:Scaffold(
        appBar: AppBar(
          title: Text("Hybrid List"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            final item=items[index];
            if(item is HeadingItem){
              return ListTile(
                title: Text(
                  item.heading,
                  style:Theme.of(context).textTheme.headline
                ),
              );
            }else if(item is MessageItem){
              return ListTile(
                title: Text(item.sender),
                subtitle: Text(item.body),
              );
            }
          },
        ),
      )
    );
  }
}