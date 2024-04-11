import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/models/product_card.dart';

class CartNotifier with ChangeNotifier {
  
  final List<ProductCard> _cartlistItems = [];
  final int _total = 1;

  List<ProductCard> get cartlistItems => _cartlistItems;
  int get total => _total;

  void addProductToCart(ProductCard product) {

    if(!_cartlistItems.any((element) => element.title == product.title)){
      _cartlistItems.add(product);
      notifyListeners();
    }

  }

  void removeProductFromCart(ProductCard product) {
    _cartlistItems.removeWhere((p) => p.title == product.title);
    notifyListeners();
  }

  // void setTotal(int total) {
  //   _total = total;
  //   notifyListeners();
  // }

    void incrementItemCount( String ProductTitle) {
    for (var product in _cartlistItems){
      if (product.title == ProductTitle){
        product.quantity++;
        notifyListeners();
        break;
      }
     
    }
    notifyListeners();
  }

  void decrementItemCount(String ProductTitle) {
    for (var product in _cartlistItems){
      if (product.title == ProductTitle && product.quantity > 1){
          product.quantity--;
          notifyListeners();
          break;
        }
       
      }
  }
}

final cartProvider = ChangeNotifierProvider<CartNotifier>((ref) => CartNotifier());
