import 'package:flutter/material.dart';
import '../widgets/products/products.dart';

class HomePage extends StatelessWidget {
  Widget _buildSideDrawer(BuildContext context){
    return Drawer(
        //drawwer left side - endrawer right side / Multiple items use scrollable
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false, //quitar el icono de drawer
              title: Text('Choose'),
            ),
            ListTile(
              leading: Icon(Icons.edit),//front of the title
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
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () => {},
          ),
        ],
      ),
      body: Products(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
