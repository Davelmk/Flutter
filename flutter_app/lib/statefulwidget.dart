import 'package:flutter/material.dart';

//根据用户输入改变widget
class Counter extends StatefulWidget {
  @override
  _CounterState createState()=>new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter=0;
  void _increment(){
    setState(() {
      _counter++; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: _increment,
          child: Text("Increment")
        ),
        Text("Counter:$_counter")
      ],
    );
  }
}