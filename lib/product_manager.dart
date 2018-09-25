import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final Map startngProduct;

  ProductManager({this.startngProduct}) {
    //optional argument
    print('[productsManager]constructor');
  }
  @override
  State<StatefulWidget> createState() {
    print('[productsManager]createState');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override //called cuando el object creado inicializado
  void initState() {
    //execute when state is created
    print('[productsManager]initState');
    if (widget.startngProduct != null) {
      // si el string que nos pasa el constructor del objecto es null no haremos nada si no es asi añadimos
      _products.add(widget
          .startngProduct); //propiedades del widget padre (atributo) solo se usa en metodos
    }
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[productsManager]didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  void _addProducts(Map<String, String> product) {
    //use dynamic <dynamic>
    setState(() {
      _products.add(product);
      print(_products);
    });
  }

  void _deleteProducts(int index) {
    setState(() {
      _products.removeAt(index);
      print(_products);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[productsManager]build');
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(
              _addProducts), /*queremos pasar solamente la referencia de la funcion*/
          /*Debemos crear un widgets propios para elementos importantes que necesitan perssonalizar i muchas caracteristicas product_control
           RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).accentColor,
            onPressed: () {
              setState(() {
                _products.add('sopa');
                print(_products);
              });
            },
            child: Text('Add Product'),
          ),*/
        ),
        Expanded(
            //List view tiene que ir dentro de un container si queremos personalizar-lo si queremos que ocupe todo el espacio restante Expanded Widget
            //height: 350.0,//px
            child: Products(_products,
                deleteProduct:
                    _deleteProducts)) //llamamaos a la clase de products.dart con la list para crear la card
      ],
    );
  }
}
