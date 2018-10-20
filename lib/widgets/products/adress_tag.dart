import 'package:flutter/material.dart';

class AdressTag extends StatelessWidget{
  final String adress;

  AdressTag(this.adress);

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(9.0)),
            child: Text(
              adress,
              style: TextStyle(fontSize: 13.0),
            ),
          );
    }
}