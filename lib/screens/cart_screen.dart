import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/widgets/empty_bag.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EmptyBagWidget(
          imagePath: AssetsManager.card2,
          title: "Your Cart is empty",
          subtitle: "Like your cart is empty",
          buttonText: "shop Now")
    );
  }
}
