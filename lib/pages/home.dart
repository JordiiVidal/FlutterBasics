import 'package:flutter/material.dart';
import '../product_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,//quitar el icono de drawer
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Manage Products'),
              onTap: () {},
            )
          ],
        ),
      ), //drawwer left side - endrawer right side / Multiple items use scrollable
      appBar: AppBar(
        title: Text('BuyList'),
      ),
      body: ProductManager(),
    );
  }
}
