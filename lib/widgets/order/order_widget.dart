import 'package:ecommerce_flutter/constans/app_constans.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdersWidgetFree extends StatefulWidget {
  const OrdersWidgetFree({super.key});

  @override
  State<OrdersWidgetFree> createState() => _OrdersWidgetFreeState();
}

class _OrdersWidgetFreeState extends State<OrdersWidgetFree> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.25,
              width: size.width* 0.25,
              imageUrl: AppConstans.imageUrl,
            ),
          ),
          Flexible(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            child: TitleTextWidget(label: "Product Title", fontSize: 15,)
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.clear,
                          color: Colors.red, size: 20,))
                      ],
                    ),
                    Row(
                      children: [
                        TitleTextWidget(label: "Price"),
                        const SizedBox(width: 15,),
                        Flexible(child: SubTitleTextWidget(label: "\$11.00",))
                      ],
                    ),
                    const SizedBox(height: 7,),
                    const SubTitleTextWidget(label: "qty : 20", fontSize: 13,)
                  ],
                ),

              )

          )
        ],
      ),


    );
  }
}
