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

  Product findById(String id){
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}