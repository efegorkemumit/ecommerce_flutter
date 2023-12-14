import 'package:ecommerce_flutter/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class HeartButtonWidget extends StatefulWidget {
  const HeartButtonWidget({
    super.key,
    this.bkgColor = Colors.transparent,
    this.size = 20,
    required this.productId,
  });

  final Color bkgColor;
  final double size;
  final String productId;
  @override
  State<HeartButtonWidget> createState() => _HeartButtonWidgetState();
}

class _HeartButtonWidgetState extends State<HeartButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: widget.bkgColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        style: IconButton.styleFrom(elevation: 10),
        onPressed: (){
          wishlistProvider.addORderRemoveWishlist(productId: widget.productId);
        },
        icon: Icon(
          wishlistProvider.isProdingWishlist(productId: widget.productId)
         ? IconlyBold.heart
           : IconlyLight.heart,
          size: widget.size,

          color:wishlistProvider.isProdingWishlist(productId: widget.productId) ? Colors.red
              :Colors.grey,

        )

      ),
    );
  }
}
