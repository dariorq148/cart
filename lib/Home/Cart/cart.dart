import 'package:flutter/material.dart';
import 'package:shoppingcart/Models/product__class.dart';


class Cart extends StatelessWidget {
  //llamamos a la lista de seleccionados
  final List<Product> seleccionados;

  const Cart({super.key, required this.seleccionados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
         child: Padding(padding: EdgeInsets.symmetric(horizontal: 25),
          child: ListView.builder(
            itemCount: seleccionados.length,
            itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(seleccionados[index].image),
              title: Text(seleccionados[index].name),
              subtitle: Text(seleccionados[index].description),
              trailing: Text(seleccionados[index].price.toString()),
            );
          },),

         ),
      ),
    );
  }
}

