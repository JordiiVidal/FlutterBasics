import 'package:flutter/material.dart';
import 'price_tag.dart';

class ProductCard extends StatelessWidget{

  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
    return Card(
      color: Colors.white.withOpacity(0.7),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          //SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Text(
                    product['title'],
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald'),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: PriceTag(product['price'].toString()),
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
            IconButton(
              //button without cbackground only text
              icon: Icon(Icons.info),
              color: Theme.of(context).accentColor,
              onPressed: () => Navigator.pushNamed<bool>(
                  context,
                  '/product/' +
                      productIndex
                          .toString()), //use => one line code //navigation es como un stack que tienes que hacer push del scaffold para poder vnavegar
            ),
            IconButton(
              icon: Icon(Icons.star_border),
              color: Colors.red,
              onPressed: () => {},
            )
          ]) //Multiple buttons size by size
        ],
      ),
    );                                                                 
    }
}