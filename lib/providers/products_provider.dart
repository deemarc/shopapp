import 'package:flutter/material.dart';
import 'product.dart';
import '../dummy_data/dummy_product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [...loadedProducts];

  var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly){
    //   return _items.where((prod) => prod.isFavourite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return [..._items.where((element) => element.isFavourite)];
  }
  // void showFavoritesOnly(){
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }
  //
  // void showAll(){
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
        id: DateTime.now().toString(),
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl);
    _items.add(newProduct);
    // _items.insert(0, newProduct); // at the beginning of product list
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex != null && prodIndex >= 0){
      _items[prodIndex] = newProduct;
      notifyListeners();
    }

  }

  void deleteProduct(String id){
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    _items.removeAt(prodIndex);
    notifyListeners();
  }
}
