import 'package:flutter/material.dart';
import './product.dart';

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  ShoppingList({Key key,this.products}):super(key:key);

  @override
  _ShoppingListState createState()=>new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList>{
  Set<Product> _shoppingCart =new Set<Product>();

  void _handleCartChanged(Product product,bool inCart){
    setState(() {
     if(inCart)
      _shoppingCart.add(product);
    else
      _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShoppingList"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
          return ShoppingListItem(
            product:product,
            inCart:_shoppingCart.contains(product),
            onCartChanged:_handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
