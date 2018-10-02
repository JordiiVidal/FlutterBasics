import 'package:flutter/material.dart';
import 'home.dart';
import 'product_create.dart';
import 'product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      //TAB TOP PAGE
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false, //quitar el icono de drawer
                title: Text('Choose'),
              ),
              ListTile(
                title: Text('Porduct Admin'),
                onTap: () => Navigator.pushReplacementNamed(context, '/'),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('User'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.new_releases),
                text: 'Create Product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My products',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatPage(),
            ProductListPage(),
          ],
        ),
        //bottomNavigationBar: TabBar(tabs: <Widget>[Tab(text: 'sdad',),Tab(text: 'sas',)],),
      ),
    );
  }
}
