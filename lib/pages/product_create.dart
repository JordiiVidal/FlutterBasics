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
  String _titleValue;
  String _descriptionValue;
  double _priceValue = 0.0;

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(
          /*icon: Icon(Icons.link)*/ labelText: 'Product Title'),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextFied() {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration(labelText: 'Product Description'),
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildProductPriceTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/richarlison.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/roducts');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          //autofocus que cuando se inicialize la page salga el teclado
          //onCganged trigger que cada vez que cambia
          _buildTitleTextField(),
          _buildDescriptionTextFied(),
          _buildProductPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('SAVE'),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: _submitForm,//only reference executed if you click that button
          ),
          //Text(titleValue),
        ],
      ),
    );
  }
}
