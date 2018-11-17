import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/ui_elements/title_default.dart';
import '../scoped-models/products.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  _showWarningDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannnot be undone!'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.close),
                iconSize: 29.0,
                onPressed: () {
                  Navigator.pop(context); //close alert
                },
              ),
              IconButton(
                  icon: Icon(Icons.delete_forever),
                  onPressed: () {
                    Navigator.pop(context); //close alert
                    Navigator.pop(context, true); //deletetrue
                  }),
            ],
          );
        });
  }

  Widget _buildAdressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Palau Solita, Barcelona',
          style: TextStyle(fontSize: 13.0, fontFamily: 'Oswald'),
        ),
        Container(
          child: Text(
            '|',
            style: TextStyle(
                fontFamily: 'Oswald', color: Colors.black.withOpacity(0.7)),
          ),
          margin: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Text('\$ '+price.toString()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        //listener back button software o hardwwe
        onWillPop: () {
      print('backbutton');
      Navigator.pop(context,
          false); //damos permiso para que el usuario tire para atras cuando le de al backbutton delmob y ademas decidimos si true o false , en este caso no queremos que se elimine el product
      return Future.value(false); //allow the user to leave
    }, child: ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget widget, ProductsModel model) {
        final Product product = model.products[productIndex];
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.9),
          appBar: AppBar(
            title: Text(product.title),
          ),
          body: Center(
            //no es necasario pq una imagen coge todo el width possible
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,x
              crossAxisAlignment: CrossAxisAlignment
                  .center, //solo funcionara con el widget center como padre pq sino no tiene un width establecido
              children: <Widget>[
                Container(
                  child: Image.asset(product.image),
                  padding: EdgeInsets.all(10.0),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      TitleDefault(product.title),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        product.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ),
                _buildAdressPriceRow(product.price),
                ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.backspace),
                        onPressed: () => Navigator.pop(
                            context), //pop para quitar del stack y push para añadir
                      ),
                      IconButton(
                        iconSize: 30.0,
                        icon: Icon(Icons.delete),
                        onPressed: () => _showWarningDialog(
                            //wraper in other funcion - es decir crea otra funcion para que llame esta
                            context), // si ponemos llamamos funcion() se ejecutara imediatament y solo queremos cuando
                      ),
                    ])
              ],
            ),
          ),
        );
      },
    ));
  }
}
