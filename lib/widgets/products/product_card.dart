import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'price_tag.dart';
import '../ui_elements/title_default.dart';
import 'adress_tag.dart';
import '../../models/product.dart';
import '../../scoped-models/main.dart';

class ProductCard extends StatelessWidget {
  final Product product;
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
          Image.asset(product.image),
          //SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: TitleDefault(product.title),
                ),
                Expanded(
                  flex: 3,
                  child: PriceTag(product.price.toString()),
                ),
              ],
            ),
          ),
          AdressTag('Rio Janeiro, Brasil'),
          Text(product.userEmail),
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
            ScopedModelDescendant<MainModel>(
              builder:
                  (BuildContext context, Widget child, MainModel model) {
                return IconButton(
                  icon: Icon(model.products[productIndex].isfavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {
                    model.selectProduct(productIndex);
                    model.favoriteStatus();
                  },
                );
              },
            )
          ]) //Multiple buttons size by size
        ],
      ),
    );
  }
}
