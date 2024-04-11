
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/models/product_card.dart';

class WishlistNotifier with ChangeNotifier {
  
  final List<ProductCard> _wishlistItems = [];
  List<ProductCard> get wishlistItems => _wishlistItems;

  void addProductToWishlist(ProductCard product) {

    if(!_wishlistItems.any((element) => element.title == product.title)){
      _wishlistItems.add(product);
      notifyListeners();
    }

  }

  void removeProductFromWishlist(ProductCard product) {
    _wishlistItems.removeWhere((p) => p.title == product.title);
    notifyListeners();
  }
}

 final wishlistProvider = ChangeNotifierProvider((ref) => WishlistNotifier());