import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget{
final Function addproduct;

  ProductControl(this.addproduct);

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).accentColor,
            onPressed: () {
              addproduct({'title':'Chocolte','image':'assets/richarlison.jpg'});
              /*Dentro de stateless no podemos modificar el state de un widget, y no quiero tener dos stateful que hacen lo mismo
              setState(() {
                _products.add('sopa');
                print(_products);
              });*/
            },
            child: Text('Add Product'),
          );
    }
}