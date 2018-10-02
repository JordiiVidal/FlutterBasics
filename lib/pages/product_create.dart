import 'package:flutter/material.dart';

class ProductCreatPage extends StatefulWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductCreatPage(this.addProduct, this.deleteProduct);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatPage> {
  String titleValue;
  String descriptionValue;
  double priceValue = 0.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          //autofocus que cuando se inicialize la page salga el teclado
          //onCganged trigger que cada vez que cambia
          TextField(
            decoration: InputDecoration(
                /*icon: Icon(Icons.link)*/ labelText: 'Product Title'),
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(labelText: 'Product Description'),
            onChanged: (String value) {
              setState(() {
                descriptionValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Price'),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                priceValue = double.parse(value);
              });
            },
          ),
          RaisedButton(
            child: Text('SAVE'),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': titleValue,
                'description': descriptionValue,
                'price': priceValue,
                'image':'assets/richarlison.jpg'
              };
              widget.addProduct(product);
            },
          ),
          //Text(titleValue),
        ],
      ),
    );
  }
}
