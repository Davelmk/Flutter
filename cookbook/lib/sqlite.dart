import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Dog{
  final int id;
  final String name;
  final int age;
  Dog({this.id,this.name,this.age});
  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "name":name,
      "age":age
    };
  }
  @override
  String toString() {
    return "Dog{id:$id,name:$name,age:$age}";
  }
}

void main() async{
  final database=openDatabase(
    join(await getDatabasesPath(),"dog.db"),
    onCreate: (db,version){
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)"
      );
    },
    version: 1
  );

  Future insert(Dog dog) async{
    final Database db=await database;
    await db.insert(
      "dogs", 
      dog.toMap(),
      //冲突解决：覆盖
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<Dog>> dogs() async{
    final Database db=await database;
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i){
      return Dog(
        id: maps[i]["id"],
        name: maps[i]["name"],
        age: maps[i]["age"],
      );
    });
  }

  Future<void> update(Dog dog) async{
    final Database db=await database;
    await db.update(
      "dogs", 
      dog.toMap(),
      where: "id=?",
      //防止SQL注入攻击
      whereArgs: [dog.id]
    );
  }

  Future<void> delete(int id) async{
    final Database db=await database;
    await db.delete(
      "dogs",
      where:"id=?",
      whereArgs:[id]
    );
  }

  //测试
  //insert
  var fido=Dog(id:0,name:"fido",age:3);
  await insert(fido);
  print(await dogs());
  //update
  fido = Dog(
    id: fido.id,
    name: fido.name,
    age: fido.age + 7,
  );
  await update(fido);
  print(await dogs());
  //delete
  await delete(fido.id);
  print(await dogs());
}