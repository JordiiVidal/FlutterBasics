import 'package:flutter/material.dart';
import '../product_manager.dart';
import 'products_admin.dart';

class HomePage extends StatelessWidget {
  final List<Map<String,String>> products;
  final Function addProduct;
  final Function deleteProduct;

  HomePage(this.products,this.addProduct,this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        //drawwer left side - endrawer right side / Multiple items use scrollable
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false, //quitar el icono de drawer
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Product Admin'),
              onTap: () => Navigator.pushReplacementNamed(context, '/admin'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('BuyList'),
      ),
      body: ProductManager(products, addProduct, deleteProduct),
    );
  }
}
