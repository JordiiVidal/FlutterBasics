import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannnot be undone!'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCARD'),
                onPressed: () {
                  Navigator.pop(context); //close alert
                },
              ),
              FlatButton(
                  child: Text('DELETE'),
                  onPressed: () {
                    Navigator.pop(context); //close alert
                    Navigator.pop(context, true); //deletetrue
                  }),
            ],
          );
        });
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
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Center(
          //no es necasario pq una imagen coge todo el width possible
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,x
            crossAxisAlignment: CrossAxisAlignment
                .center, //solo funcionara con el widget center como padre pq sino no tiene un width establecido
            children: <Widget>[
              Image.asset(this.imageUrl),
              Container(padding: EdgeInsets.all(10.0), child: Text(this.title)),
              ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
                FlatButton(
                  child: Text('BACK'),
                  onPressed: () => Navigator.pop(
                      context), //pop para quitar del stack y push para añadir
                ),
                FlatButton(
                  child: Text("DELETE"),
                  onPressed: () => _showWarningDialog(//wraper in other funcion - es decir crea otra funcion para que llame esta
                      context), // si ponemos llamamos funcion() se ejecutara imediatament y solo queremos cuando
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
