

import 'package:ecommerce_flutter/models/cart_model.dart';
import 'package:ecommerce_flutter/providers/product_provider.dart';
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

  double geTTotal({required ProductProvider productProvider}){
    double total = 0.0;

    _cartItems.forEach((key, value) {
      final getCurrProduct =
          productProvider.findByProId(value.productId);
      if(getCurrProduct==null){
        total += 0;
      }
      else
        {
          total += double.parse(getCurrProduct.productPrice)*value.quantity;
        }

    });
    return total;

  }

  int getQty(){
    int total = 0;
    _cartItems.forEach((key, value) {
      total +=value.quantity;
    });
    return total;

  }

  void updateQty({required String productId, required int qty}){
    _cartItems.update(productId, (cartItem) => CartModel(
        cartId: cartItem.cartId, productId: productId, quantity: qty
    ));
    notifyListeners();

  }

  void removeOneItem({required String productId}){
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearLocalCart(){
    _cartItems.clear();
    notifyListeners();
  }



}