

import 'package:ecommerce_flutter/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier{
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  void addProductCart({required String productId}){

    _cartItems.putIfAbsent(productId, () => CartModel(
        cartId: const Uuid().v4(), productId: productId, quantity: 1),);
    notifyListeners();
  }

  bool isProdinCart({required String productId}){
    return _cartItems.containsKey(productId);
  }



}