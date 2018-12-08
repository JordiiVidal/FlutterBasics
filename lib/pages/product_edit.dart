import 'package:flutter/material.dart';
import '../widgets/helpers/ensure-visible.dart';
import '../models/product.dart';
import '../scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductEditPage extends StatefulWidget {
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

  Widget _buildTitleTextField(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        autovalidate: true,
        initialValue: product == null ? "" : product.title,
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

  Widget _buildDescriptionTextFied(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: _descFocusNode,
      child: TextFormField(
        focusNode: _descFocusNode,
        initialValue: product == null ? "" : product.description,
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

  Widget _buildProductPriceTextField(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: _priceFocusNode,
      child: TextFormField(
        focusNode: _priceFocusNode,
        initialValue: product == null ? "" : product.price.toString(),
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            //si no hace match con number
            return 'Price is reqired and should be 10+ characters long';
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

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget widget, MainModel model) {
        return model.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GestureDetector(
                onTap: () => _submitForm(
                    model.addProduct,
                    model.updateProduct,
                    model.selectProduct,
                    model
                        .selectedProductIndex), //only is pressed and reference of model function
                child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(5.0),
                  child: Text('Mybuton'),
                ),
              );
      },
    );
  }

  Widget _buildPageContent(BuildContext context, Product product) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final Orientation deviceOrientation = MediaQuery.of(context).orientation;
    /*final targetWidthO =
        deviceOrientation == Orientation.landscape ? 200.0 : 500.0; //IF / ELSE*/
    final targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
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
              _buildTitleTextField(product),
              _buildDescriptionTextFied(product),
              _buildProductPriceTextField(product),
              SizedBox(
                height: 10.0,
              ),
              /*RaisedButton(
            child: Text('SAVE'),
            textColor: Colors.white,
            onPressed: _submitForm,//only reference executed if you click that button
          ),*/
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  _submitForm(
      Function addProduct, Function updateProduct, Function selectedProduct,
      [int selectedProductIndex]) {
    //[optional]
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (selectedProductIndex == null) {
      addProduct(
        _formData['title'],
        _formData['description'],
        _formData['image'],
        _formData['price'],
      ).then((_)=>  Navigator
        .pushReplacementNamed(context, '/products')
        .then((_) => selectedProduct(null)));
    } else {
      updateProduct(
        _formData['title'],
        _formData['description'],
        _formData['image'],
        _formData['price'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget widget, MainModel model) {
        final Widget pageContent =
            _buildPageContent(context, model.selectedProduct);
        return model.selectedProductIndex ==
                null //si entramos para crear le pasamos la pagina normal si queremos editar tiene que ser un nuevo scaffold
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Product'),
                ),
                body: pageContent,
              );
      },
    );
  }
}
