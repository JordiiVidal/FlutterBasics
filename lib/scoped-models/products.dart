import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];//this instance is stored in momeory

  List<Product> get products{
    return List.from(_products);//retunr and a copy because only exist one slist stored in momery, new pointer
  }

  void addProduct(Product product) {
    _products.add(product);
    print(_products);
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    print(_products);
  }

  void updateProduct(int index, Product product) {
    _products[index] = product;
  }
}
