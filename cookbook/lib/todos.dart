import 'package:flutter/material.dart';

class Todo{
  final String title;
  final String description;
  Todo(this.title,this.description);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todos",
      home: TodoList(),
    );
  }
}

class TodoList extends StatelessWidget {
  final List<Todo> todos=new List<Todo>.generate(
    20, 
    (i)=>Todo("Todo $i", "description of Todo $i")
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context,index){
          return ListTile(
            title:Text(todos[index].title),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>Item(todo:todos[index])
              ));
            },
          );
        },
      )
    );
  }
}

class Item extends StatelessWidget {
  final Todo todo;
  Item({Key key,@required this.todo}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(
        child: Text(todo.description),
      ),
    );
  }
}