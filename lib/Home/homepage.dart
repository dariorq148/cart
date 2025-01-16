import 'package:flutter/material.dart';

import 'package:shoppingcart/Home/Cart/cart.dart';
import 'package:shoppingcart/Models/product___json.dart';
import 'package:shoppingcart/Models/product__class.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late List<Product> products = [];

  //seleccion
  List<Product> seleccionados = [];

  @override
  void initState() {
    // TODO: implement initState
    products = Product.parseProducts(products__js);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        elevation: 1,
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart(seleccionados: seleccionados,)));
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  //cambiar estado del icono
                  child: Icon(
                    seleccionados.isNotEmpty
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                  )))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Container(
            width: double.infinity,
            height: 500,
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (seleccionados.contains(products[index])) {
                        seleccionados.remove(products[index]);
                      } else {
                        seleccionados.add(products[index]);
                        print(products[index].name);
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      children: [
                        Image.asset(
                          product.image,
                          width: 100,
                          height: 100,
                        ),
                        Text(product.name),
                        Text(product.description),
                        Text(product.price.toString()),
                        Text(product.category),
                      ],
                    ),
                    decoration: BoxDecoration(
                      ///estilo de seleccion de productos
                      color: seleccionados.contains(product)
                          ? Colors.green
                          : Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
