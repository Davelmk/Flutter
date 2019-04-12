import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Files",
      home: MyHomePage(counterStorage:CounterStorage()),
    );
  }
}

class CounterStorage{
  Future<String> get _localPath async{
    final directory=await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async{
    final path=await _localPath;
    return File("$path/counter.text");
  }

  Future<int> readCounter() async{
    try{
      final file=await _localFile;
      String contents=await file.readAsString();
      return int.parse(contents);
    }catch(e){
      return 0;
    }
  }

  Future<File> writeConuter(int counter) async{
    final file=await _localFile;
    return file.writeAsString("$counter");
  }
}

class MyHomePage extends StatefulWidget {
  final CounterStorage counterStorage;
  MyHomePage({Key key,@required this.counterStorage}):super(key:key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter=0;
  @override
  void initState() {
    super.initState();
    widget.counterStorage.readCounter().then(
      (int value){
        setState(() {
          _counter=value; 
        });
      }
    );
  }

  Future<File> _incrementCounter(){
    setState(() {
      _counter++; 
    });
    return widget.counterStorage.writeConuter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File"),
      ),
      body: Center(
        child: Text("Button tapped $_counter time${_counter == 1 ? '' : 's'}."),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Increment",
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}

//Testing

// In order to test code that interacts with files, you’ll need to Mock calls to the MethodChannel.
// The MethodChannel is the class that Flutter uses to communicate with the host platform.
// In these tests, you can’t interact with the filesystem on a device. 
// You’ll need to interact with the test environment’s filesystem.
// To mock the method call, provide a setupAll function in the test file. 
// This function runs before the tests are executed.

/* setUpAll(() async {
  final directory = await Directory.systemTemp.createTemp();
  const MethodChannel('plugins.flutter.io/path_provider')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'getApplicationDocumentsDirectory') {
      return directory.path;
    }
    return null;
  });
}); */