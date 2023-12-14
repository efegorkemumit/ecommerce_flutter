import 'package:ecommerce_flutter/providers/cart_provider.dart';
import 'package:ecommerce_flutter/providers/product_provider.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBottomSheetWidget extends StatelessWidget {
  const CartBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top:BorderSide(width: 1, color : Colors.red),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:SizedBox(
          height: kBottomNavigationBarHeight +10,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  FittedBox(
                    child: TitleTextWidget(label: "Total (${cartProvider.getCartItems.length} Product/ ${cartProvider.getQty()}  Items)")),
                  SubTitleTextWidget(label: " \$ ${cartProvider.geTTotal(productProvider: productsProvider).toStringAsFixed(2)} ", color: Colors.red,)
                ],
                
              ),
              ),
              ElevatedButton(onPressed: (){}, child: const Text("Checkout"))
            ],
          ),

        )
      ),
    );
  }
}
