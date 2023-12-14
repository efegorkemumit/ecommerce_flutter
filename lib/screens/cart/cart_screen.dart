import 'package:ecommerce_flutter/providers/cart_provider.dart';
import 'package:ecommerce_flutter/screens/cart/bottom_checkout.dart';
import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/screens/cart/cart_widget.dart';
import 'package:ecommerce_flutter/screens/cart/empty_bag.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = true;


  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty ?
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
        title:  TitleTextWidget(label: "Cart (${cartProvider.getCartItems.length})"),
        actions: [
          IconButton(onPressed: (){
            cartProvider.clearLocalCart();

          }, icon: const Icon(Icons.delete_forever_rounded, color:Colors.red))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: cartProvider.getCartItems.length,
                  itemBuilder: (context, index){
                    return ChangeNotifierProvider.value(
                        value: cartProvider.getCartItems.values.toList()[index],
                      child: const CardWidget(),
                    );
                  }
              )
          )
        ],
      )


    );
  }
}
