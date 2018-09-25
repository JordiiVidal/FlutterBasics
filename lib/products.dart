import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String,String>> products;
  final Function deleteProduct;
  //final cada vez que se llame al constructor remplazara la lista i nunca cambiara
  Products(this.products, {this.deleteProduct}) {
    //can't be change this list, can't add
    print('[products]constructor');
  } //constructor

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
              //button without cbackground only text
              child: Text("Details"),
              onPressed: () => Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProductPage(products[index]['title'],products[index]['image']),
                    ),
                  ).then((bool value) {//promise avascript
                    print(value);
                    if(value){
                      deleteProduct(index);
                    }
                  }), //use => one line code //navigation es como un stack que tienes que hacer push del scaffold para poder vnavegar
            ),
            FlatButton(
              child: Text("Details 2"),
              onPressed: () => {},
            )
          ]) //Multiple buttons size by size
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        //if else
        itemBuilder:
            _buildProductItem, //no usamos funcion sino referencia a la funcion
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
