import 'package:flutter/material.dart';
import 'home.dart';

class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false, //quitar el icono de drawer
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Home Page'),
              onTap: () => Navigator.pushReplacement(//Queremos remplazar el scaffold solamente manteniendolo en el stack
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage())),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('User'),
      ),
      body: Center(
        child: Text('User Page'),
      ),
    );
  }
}
