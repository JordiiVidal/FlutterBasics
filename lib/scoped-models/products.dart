import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = []; //this instance is stored in momeory
  bool _showFavorties = false;
  int _selectedProductIndex;

  List<Product> get products {
    return List.from(
        _products); //retunr and a copy because only exist one slist stored in momery, new pointer
  }

  List<Product> get dispalyProducts {
    if (_showFavorties) {
      return _products.where((Product product)=>product.isfavorite).toList();//solo incluira los products que tengan favorite true 
    }
    return List.from(_products);//show all
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }
  bool get displayFavorite{
    return _showFavorties;
  }

  Product get selectedProduct {
    if (_selectedProductIndex == null) {
      return null;
    }
    return _products[_selectedProductIndex];
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
    print(_products);
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
    print(_products);
    notifyListeners();
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
  }

  void favoriteStatus() {
    final Product selectedProduct = _products[_selectedProductIndex];
    final bool isCurrentlyFavorite = selectedProduct.isfavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updateProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      isfavorite: newFavoriteStatus,
    );
    _products[_selectedProductIndex] = updateProduct;
    _selectedProductIndex = null;
    notifyListeners(); //SETsTATE IN STATELESS WIDGET, re render their builder methods effect this scoped model
  }

  void changeFavorite() {
    _showFavorties = !_showFavorties;
    _selectedProductIndex = null;
    notifyListeners();
  }
}
