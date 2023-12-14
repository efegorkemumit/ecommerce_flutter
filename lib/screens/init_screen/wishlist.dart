import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_flutter/providers/wishlist_provider.dart';
import 'package:ecommerce_flutter/screens/cart/bottom_checkout.dart';
import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/screens/cart/cart_widget.dart';
import 'package:ecommerce_flutter/screens/cart/empty_bag.dart';
import 'package:ecommerce_flutter/widgets/products/product_widget.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  static const routName = "/WishlistScreen";

  const WishlistScreen({super.key});
  final bool isEmpty = false;


  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishlistProvider>(context);

    return wishListProvider.getWishLists.isEmpty ?
    Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: (){
                if(Navigator.canPop(context)){
                  Navigator.pop(context);
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
            title: const TitleTextWidget(label: "Wishlist")
        ),
        body: EmptyBagWidget(
            imagePath: AssetsManager.bagimg7,
            title: "Your Cart is empty",
            subtitle: "Like your cart is empty",
            buttonText: "shop Now")
    )
        :Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            if(Navigator.canPop(context)){
              Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        title:  TitleTextWidget(label: "Wishlist ${wishListProvider.getWishLists.length}")
      ),
      body: DynamicHeightGridView(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        builder: (context,index){
          return Padding(
          padding: const EdgeInsets.all(8.0),
            child: ProductWidget(
              productId: wishListProvider.getWishLists.values.toList()[index].productId,

            ),
          );

        },
      itemCount: wishListProvider.getWishLists.length,
      crossAxisCount: 2,
      )

    );
  }
}
