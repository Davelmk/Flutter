import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared preferences",
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Key-Value"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              "$_counter",
              style:Theme.of(context).textTheme.display1
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() { 
    super.initState();
    _loadCounter();
  }

  _loadCounter() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    setState(() {
      _counter=(sharedPreferences.getInt('counter') ?? 0); 
    });
  }

  _incrementCounter() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    setState(() {
      _counter=(sharedPreferences.getInt("counter")??0)+1;
      sharedPreferences.setInt("counter", _counter);
    });
  }
}