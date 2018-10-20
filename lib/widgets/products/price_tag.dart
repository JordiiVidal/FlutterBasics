import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget{
  final String price;

  PriceTag(this.price);

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
                    margin: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
                    child: Text(
                      '\$$price',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Oswald'),
                    ),
                  );
    }
}