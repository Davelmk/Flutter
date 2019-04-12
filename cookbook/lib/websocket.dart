import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WebSocket",
      home: HomePage(
        channel:IOWebSocketChannel.connect("ws://echo.websocket.org")
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final WebSocketChannel channel;
  HomePage({Key key,@required this.channel}):super(key:key);
  @override
  _HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocket"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Send a message"
                ),
              ),
            ),
            StreamBuilder(
              stream: widget.channel.stream ,
              builder: (context, snapshot){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? "${snapshot.data}" : "null"),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:_sendMessage,
        tooltip: "Send Message",
        child: Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }

  void _sendMessage(){
    if(_controller.text.isNotEmpty){
      widget.channel.sink.add(_controller.text);
    }
  }
}