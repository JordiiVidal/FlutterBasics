import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart'
    as http; // todo lo que venga de este package estara agrupado en la variable http
import 'dart:async';
import 'dart:convert'; //convert data

import '../models/product.dart';
import '../models/user.dart';

class ConnectedProductModel extends Model {
  List<Product> _products = []; //this instance is stored in momeory
  User _authenticatedUser;
  int _selProductIndex;
  bool _isLoading = false;

  Future<Null> addProduct(
      String title, String description, String image, double price) {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> productData = {
      'title': title,
      'description': description,
      'image':
          'https://blog.liebherr.com/electrodomesticos/es/wp-content/uploads/sites/27/2017/07/chocolate-banner-superior-753x493.png',
      'price': price,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id
    };
    return http
        .post('https://flutter-products-4ba4d.firebaseio.com/products.json',
            body: json.encode(productData))
        .then((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final Product newProduct = Product(
          id: responseData['name'],
          title: title,
          description: description,
          image: image,
          price: price,
          userEmail: _authenticatedUser.email,
          userId: _authenticatedUser.id);
      _products.add(newProduct);
      print(_products);
      _isLoading = false;
      notifyListeners();
    });
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

  void fetchProducts() {
    _isLoading = true;
    notifyListeners();
    http
        .get('https://flutter-products-4ba4d.firebaseio.com/products.json')
        .then((http.Response response) {
      final List<Product> fetchproductList = [];
      final Map<String, dynamic> productListData = jsonDecode(response.body);
      if(productListData == null){
        _isLoading = false;
        notifyListeners();
        return;
      }
      productListData.forEach((String key, dynamic productData) {
        final Product product = Product(
            id: key,
            title: productData['title'],
            description: productData['description'],
            image: productData['image'],
            price: productData['price'],
            userEmail: productData['userEmail'],
            userId: productData['userId']);

        fetchproductList.add(product);
      });
      _products = fetchproductList;
      _isLoading = false;
      notifyListeners();
    });
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

class UserModel extends ConnectedProductModel {
  void login(String email, String password) {
    _authenticatedUser =
        new User(id: 'sasas', email: email, password: password);
  }
}

class UtilityModel extends ConnectedProductModel {
  bool get isLoading {
    return _isLoading;
  }
}
