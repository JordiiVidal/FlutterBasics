import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import 'connected_product.dart';

class ProductsModel extends ConnectedProduct {

  bool _showFavorties = false;

  List<Product> get allProducts {
    return List.from(
        products); //retunr and a copy because only exist one slist stored in momery, new pointer
  }

  List<Product> get dispalyProducts {
    if (_showFavorties) {
      return products.where((Product product)=>product.isfavorite).toList();//solo incluira los products que tengan favorite true 
    }
    return List.from(products);//show all
  }

  int get selectedProductIndex {
    return selProductIndex;
  }
  bool get displayFavorite{
    return _showFavorties;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return products[selectedProductIndex];
  }

 

  void deleteProduct() {
    products.removeAt(selectedProductIndex);
    selProductIndex = null;
    print(products);
    notifyListeners();
  }

  void updateProduct(String title, String description, String image, double price) {
    final Product updateProduct = Product(title: title,description: description,image: image,price: price, userEmail: selectedProduct.userEmail, userId: selectedProduct.userId);
    products[selectedProductIndex] = updateProduct;
    selProductIndex = null;
    notifyListeners();
  }

  void selectProduct(int index) {
    selProductIndex = index;
  }

  void favoriteStatus() {
    final Product selectedProduct = products[selectedProductIndex];
    final bool isCurrentlyFavorite = selectedProduct.isfavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updateProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      isfavorite: newFavoriteStatus,
      userEmail: selectedProduct.userEmail,
      userId: selectedProduct.userId
    );
    products[selectedProductIndex] = updateProduct;
    selProductIndex = null;
    notifyListeners(); //SETsTATE IN STATELESS WIDGET, re render their builder methods effect this scoped model
  }

  void changeFavorite() {
    _showFavorties = !_showFavorties;
    selProductIndex = null;
    notifyListeners();
  }
}
