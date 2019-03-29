import 'package:flutter/material.dart';
// import './widget.dart';
// import './materialwidget.dart';
// import './counter.dart';
import './shoppinglist.dart';
import './product.dart';

void main(){
  runApp(
    MaterialApp(
      title: "MyApp",
      // home: MyScaffold(),
      // home: Counter(),
      home:ShoppingList(
        products: <Product>[
          Product(name:'Eggs'),
          Product(name:'Flour'),
          Product(name:'Chips'),
        ],
      ),
    )
  );
}