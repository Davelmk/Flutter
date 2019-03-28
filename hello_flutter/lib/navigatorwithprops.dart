import 'package:flutter/material.dart';

class Product {
  //商品名
  final String title;
  //商品描述
  final String description;
  Product(this.title,this.description);
}

void main(){
  runApp(
    MaterialApp(
      title: "传参导航",
      home: ProductList(
        products:List.generate(
          20, 
          (i)=>Product('商品$i','商品$i的详情')
        )
      ),
    )
  );
}

class ProductList extends StatelessWidget {

  final List<Product> products;
  ProductList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(products[index].title),
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=>ProductDetail(product:products[index])
              )
            );
          },
        );
       },
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail({Key key,@required this.product}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${product.title}")),
      body: Center(
        child: Text(
          "${product.description}" 
        ),
      ),
    );
  }
}