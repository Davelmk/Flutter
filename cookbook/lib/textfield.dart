import 'package:flutter/material.dart';

/* TextField(
  decoration: InputDecoration(
    border: InputBorder.none,
    hintText: 'Please enter a search term'
  ),
); */

/* TextFormField(
  decoration: InputDecoration(
    labelText: 'Enter your username'
  ),
); */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Text Field Focus",
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode=FocusNode();
  }
  @override
  void dispose() {
    //Clean up the focus node when the Form is disposed
    myFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field Focus"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
            ),
            TextField(
              //直接Tap也可以Focus
              autofocus: false,
              focusNode: myFocusNode,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          FocusScope.of(context).requestFocus(myFocusNode);
        },
        tooltip: "Focus Second Text Field",
        child: Icon(Icons.edit),
      ),
    );
  }
}
