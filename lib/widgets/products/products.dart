import 'package:flutter/material.dart';
import 'product_card.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped-models/main.dart';
import '../../models/product.dart';


class Products extends StatelessWidget {

  Widget _buildProductList(List<Product> products) {
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
    return  ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model){
      return  _buildProductList(model.dispalyProducts);
    } ,);
  }
}
