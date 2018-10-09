import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  //final cada vez que se llame al constructor remplazara la lista i nunca cambiara
  Products(this.products) {
    //can't be change this list, can't add
    print('[products]constructor');
  } //constructor

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          //SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  products[index]['title'],
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
                  child: Text(
                    '\$${products[index]['price'].toString()}',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Oswald'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(9.0)),
            child: Text(
              'Palau Solita, Barcelona',
              style: TextStyle(fontSize: 13.0),
            ),
          ),
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
              //button without cbackground only text
              child: Text("Details"),
              onPressed: () => Navigator.pushNamed<bool>(
                  context,
                  '/product/' +
                      index
                          .toString()), //use => one line code //navigation es como un stack que tienes que hacer push del scaffold para poder vnavegar
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
