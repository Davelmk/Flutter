import 'package:flutter/material.dart';

//Form表单使用
// https://www.jianshu.com/p/448706b2dd80

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form")
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey=GlobalKey<FormState>();
  String _name;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Name:"
            ),
            //value=TextFormField的内容
            onSaved: (value){
              this._name=value;
              print("saved:$value");
            },
            validator: (value){
              if(value.isEmpty){
                return "Empty Text";
              }
            },
          ),
          Center(
            // padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RaisedButton(
              color: Colors.greenAccent,
              onPressed: (){
                if(_formKey.currentState.validate()){
                  // print(_formKey.currentState.toString());
                  //保存State中数据
                  _formKey.currentState.save();
                  Scaffold.of(context).showSnackBar(SnackBar(content:Text("$_name")));
                }
              },
              child: Text("Submit"),
            ),
          )
        ],
      ),
    );
  }
}