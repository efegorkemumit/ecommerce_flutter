import 'package:ecommerce_flutter/screens/cart/bottom_checkout.dart';
import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/screens/cart/cart_widget.dart';
import 'package:ecommerce_flutter/screens/cart/empty_bag.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;


  @override
  Widget build(BuildContext context) {
    return isEmpty ?
      Scaffold(
      body: EmptyBagWidget(
          imagePath: AssetsManager.card2,
          title: "Your Cart is empty",
          subtitle: "Like your cart is empty",
          buttonText: "shop Now")
    )
        :Scaffold(
      bottomSheet: CartBottomSheetWidget(),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
              AssetsManager.bagimg2
          ),

        ),
        title: const TitleTextWidget(label: "Cart (7)"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever_rounded, color:Colors.red))
        ],
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return const CardWidget();
      }),

    );
  }
}
