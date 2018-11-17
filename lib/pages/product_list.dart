import 'package:flutter/material.dart';
import 'product_edit.dart';
import '../models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/products.dart';

class ProductListPage extends StatelessWidget {
  Widget _buildAddedButton(
      BuildContext context, int index, ProductsModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductEditPage();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget widget, ProductsModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.products[index].title),
              background: Container(
                color: Colors.blue,
              ),
              secondaryBackground: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  //delete
                  model.selectProduct(index);
                  model.deleteProduct();
                }
                if (direction == DismissDirection.startToEnd) {
                  print('startend');
                }
                if (direction == DismissDirection.horizontal) {
                  print('horitzontal');
                }
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(model.products[index].image),
                    ),
                    title: Text(model.products[index].title),
                    subtitle: Text(model.products[index].price.toString()),
                    trailing: _buildAddedButton(context, index, model),
                  ),
                  Divider(),
                ],
              ),
            );
          },
          itemCount: model.products.length,
        );
      },
    );
  }
}
