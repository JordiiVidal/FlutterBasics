import 'package:flutter/material.dart';
import '../product_manager.dart';
import 'products_admin.dart';

class HomePage extends StatelessWidget {
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
              title: Text('User Page'),
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProductsAdminPage())),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('BuyList'),
      ),
      body: ProductManager(),
    );
  }
}
