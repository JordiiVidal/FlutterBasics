import 'package:flutter/material.dart';
import 'price_tag.dart';
import '../ui_elements/title_default.dart';
import 'adress_tag.dart';

class ProductCard extends StatelessWidget {
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
                  child: TitleDefault(product['title']),
                ),
                Expanded(
                  flex: 3,
                  child: PriceTag(product['price'].toString()),
                ),
              ],
            ),
          ),
          AdressTag('Rio Janeiro, Brasil'),
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
