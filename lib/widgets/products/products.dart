import 'package:flutter/material.dart';
import 'product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  //final cada vez que se llame al constructor remplazara la lista i nunca cambiara
  Products(this.products) {
    //can't be change this list, can't add
    print('[products]constructor');
  } //constructor

 
  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        //if else
        itemBuilder:
           (BuildContext context, int index) =>ProductCard(products[index], index), //no usamos funcion sino referencia a la funcion
        itemCount: products.length,
      );
    } else {
      productCard = Container();
      //nunca podemos devolver un null en el build
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print('[products]build');
    return _buildProductList();
  }
}
