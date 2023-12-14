
import 'dart:developer';

import 'package:ecommerce_flutter/constans/app_constans.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/providers/cart_provider.dart';
import 'package:ecommerce_flutter/providers/viewed_recently_providers.dart';
import 'package:ecommerce_flutter/widgets/products/heart_btn.dart';
import 'package:ecommerce_flutter/widgets/products/product_details.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class TopProductWidget extends StatelessWidget {
  const TopProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    final productsModel = Provider.of<ProductModel>(context);
    final viewedProvider = Provider.of<ViewedProdProvider>(context);


    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () async{
            viewedProvider.addViewProd(productId: productsModel.productId);

            await Navigator.pushNamed(context, ProductDetailScreen.routName, arguments:productsModel.productId );
          },
          child:  SizedBox(
            width: size.width*0.45,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: FancyShimmerImage(
                        imageUrl: productsModel.productImage,
                        height: size.width * 0.24,
                        width: size.width*0.32,
                      ),

                    ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          productsModel.productTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              IconButton(onPressed: () {},
                                  icon: HeartButtonWidget(productId:productsModel.productId ),
                              ),
                              IconButton(onPressed: () {

                                if(cartProvider.isProdinCart(
                                    productId: productsModel.productId))
                                {
                                  return;
                                }
                                cartProvider.addProductCart(productId: productsModel.productId);



                              },
                                  icon:  Icon(
                                      cartProvider.isProdinCart(
                                          productId: productsModel.productId)
                                          ? Icons.check
                                          : Icons.add_shopping_cart_outlined),
                              ),
                            ],
                          ),
                        ),
                         FittedBox(
                          child: SubTitleTextWidget(
                              label: "\$ ${productsModel.productPrice}",
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        )
                      ],
                    )
                )

              ],

            ),
          ),
        
      ),
    );
  }
}
