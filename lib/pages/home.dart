import 'package:flutter/material.dart';
import '../widgets/products/products.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';

class HomePage extends StatefulWidget {
  final MainModel model;

  HomePage(this.model);

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _ProductPageState();
    }
}
class _ProductPageState extends State<HomePage>{
  @override//when render for the first time, page loaded 
  initState(){
    widget.model.fetchProducts();
    super.initState();

  }
  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      //drawwer left side - endrawer right side / Multiple items use scrollable
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false, //quitar el icono de drawer
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit), //front of the title
            subtitle: Text('Subtitulo'),
            title: Text('Product Admin'),
            onTap: () => Navigator.pushReplacementNamed(context, '/admin'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('BuyList'),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget widget, MainModel model) {
            return IconButton(
              icon: Icon(model.displayFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                model.changeFavorite();
              },
            );
          }),
        ],
      ),
      body: Products(), //load de todos los products
    );
  }
}
