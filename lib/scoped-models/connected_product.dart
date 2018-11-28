import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import '../models/user.dart';

class ConnectedProductModel extends Model {
  List<Product> _products = []; //this instance is stored in momeory
  User _authenticatedUser;
  int _selProductIndex;

  void addProduct(
      String title, String description, String image, double price) {
    final Product newProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: _authenticatedUser.email,
        userId: _authenticatedUser.id);
    _products.add(newProduct);
    print(_products);
    notifyListeners();
  }
}

class ProductsModel extends ConnectedProductModel {
  bool _showFavorties = false;

  List<Product> get allProducts {
    return List.from(
        _products); //retunr and a copy because only exist one slist stored in momery, new pointer
  }

  List<Product> get dispalyProducts {
    if (_showFavorties) {
      return _products
          .where((Product product) => product.isfavorite)
          .toList(); //solo incluira los products que tengan favorite true
    }
    return List.from(_products); //show all
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  bool get displayFavorite {
    return _showFavorties;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return _products[selectedProductIndex];
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    print(_products);
    notifyListeners();
  }

  void updateProduct(
      String title, String description, String image, double price) {
    final Product updateProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);
    _products[selectedProductIndex] = updateProduct;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
  }

  void favoriteStatus() {
    final Product selectedProduct = _products[selectedProductIndex];
    final bool isCurrentlyFavorite = selectedProduct.isfavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updateProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        isfavorite: newFavoriteStatus,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);
    _products[selectedProductIndex] = updateProduct;
    notifyListeners(); //SETsTATE IN STATELESS WIDGET, re render their builder methods effect this scoped model
  }

  void changeFavorite() {
    _showFavorties = !_showFavorties;
    notifyListeners();
  }
}

class UserModel extends ConnectedProductModel{

  void login(String email, String password){
    _authenticatedUser = new User(id: 'sasas', email: email, password: password);
  }

}
