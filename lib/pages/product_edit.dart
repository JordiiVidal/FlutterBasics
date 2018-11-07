import 'package:flutter/material.dart';
import '../widgets/helpers/ensure-visible.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;
  final Map<String, dynamic> product;
  final int productIndex;

  ProductEditPage(
      {this.addProduct,
      this.product,
      this.updateProduct,
      this.deleteProduct,
      this.productIndex}); //{argument} optional

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': '',
    'description': '',
    'price': null,
    'image': 'assets/richarlison.jpg'
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  Widget _buildTitleTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        autovalidate: true,
        initialValue: widget.product == null ? "" : widget.product['title'],
        validator: (String value) {
          //si es valido  return nothing
          /*if(value.trim().length == 0){//excess espacio entre caracteres, significa que esta vacio
          return 'Title is required';
        }*/
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be 5+ characteres long';
          }
        },
        decoration: InputDecoration(
            /*icon: Icon(Icons.link)*/ labelText: 'Product Title'),
        /*onChanged: (String value) {//textfield
        setState(() {
          _titleValue = value;
        });
      },*/
        onSaved: (String argument) {
          _formData['title'] = argument;
        },
      ),
    );
  }

  Widget _buildDescriptionTextFied() {
    return EnsureVisibleWhenFocused(
      focusNode: _descFocusNode,
      child: TextFormField(
        focusNode: _descFocusNode,
        initialValue:
            widget.product == null ? "" : widget.product['description'],
        validator: (String value) {
          if (value.isEmpty || value.length < 10) {
            return 'Description is reuired and should be 10+ characters long';
          }
        },
        maxLines: 3,
        decoration: InputDecoration(labelText: 'Product Description'),
        onSaved: (String argument) {
          _formData['description'] = argument;
        },
      ),
    );
  }

  Widget _buildProductPriceTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _priceFocusNode,
      child: TextFormField(
        focusNode: _priceFocusNode,
        initialValue:
            widget.product == null ? "" : widget.product['price'].toString(),
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            //si no hace match con number
            return 'Price is reuired and should be 10+ characters long';
          }
        },
        decoration: InputDecoration(labelText: 'Product Price'),
        keyboardType: TextInputType.number,
        onSaved: (String argument) {
          //setState(() {
          _formData['price'] = double.parse(argument);
          //});
        },
      ),
    );
  }

  _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (widget.product == null) {
      widget.addProduct(_formData);
    } else {
      widget.updateProduct(widget.productIndex, _formData);
    }

    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final Orientation deviceOrientation = MediaQuery.of(context).orientation;
    /*final targetWidthO =
        deviceOrientation == Orientation.landscape ? 200.0 : 500.0; //IF / ELSE*/
    final targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    final Widget pageContent = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
            FocusNode()); //click en el el focus cambiara a uno null haciendo desaparecer el teclado y cualquier cosa abierta
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            //always take all size ->
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              //autofocus que cuando se inicialize la page salga el teclado
              //onCganged trigger que cada vez que cambia
              _buildTitleTextField(),
              _buildDescriptionTextFied(),
              _buildProductPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              /*RaisedButton(
            child: Text('SAVE'),
            textColor: Colors.white,
            onPressed: _submitForm,//only reference executed if you click that button
          ),*/
              GestureDetector(
                onTap: _submitForm,
                child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(5.0),
                  child: Text('Mybuton'),
                ),
              ),

              //Text(titleValue),
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    return widget.product ==
            null //si entramos para crear le pasamos la pagina normal si queremos editar tiene que ser un nuevo scaffold
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
