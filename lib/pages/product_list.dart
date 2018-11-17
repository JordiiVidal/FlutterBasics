import 'package:flutter/material.dart';
import 'product_edit.dart';
import '../models/product.dart';

class ProductListPage extends StatelessWidget {
  final Function updateProduct;
  final Function deleteProduct;
  final List<Product> products;

  ProductListPage(this.products, this.deleteProduct, this.updateProduct);

  Widget _buildAddedButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductEditPage(
                product: products[index],
                updateProduct: updateProduct,
                productIndex: index,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(products[index].title),
          background: Container(
            color: Colors.blue,
          ),
          secondaryBackground: Container(
            color: Colors.red,
          ),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              //delete
              deleteProduct(index);
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
                    backgroundImage: AssetImage(products[index].image),
                  ),
                  title: Text(products[index].title),
                  subtitle: Text(products[index].price.toString()),
                  trailing: _buildAddedButton(context, index)),
              Divider(),
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
