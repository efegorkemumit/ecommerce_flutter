import 'dart:developer';

import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () {
          log("to do add navigate");
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius:  BorderRadius.circular(12.0),
              child: FancyShimmerImage(
                imageUrl: 'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
                height: size.height*0.2,
                width: size.height*0.2,

              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                children: [
                  Flexible(
                    flex: 5,
                      child: TitleTextWidget(label: "Title",
                      fontSize: 18,

                      )
                  ),
                  Flexible(
                    flex:2,
                      child: IconButton(
                        onPressed: (){},
                        icon: const Icon(IconlyLight.heart),
                      )
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Padding(
                padding: EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    flex:1,
                      child: SubTitleTextWidget(label: "150.00\$", fontWeight: FontWeight.w600, color:Colors.red,)
                  ),
                  Flexible(
                      child: Material(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.lightBlue,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.0),
                          onTap: () {},
                          splashColor: Colors.grey,
                          child: const Padding
                            (
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.add_shopping_cart_outlined),
                          ),
                        ),
                      )

                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            )
          ],

        ),
      ),

    );
  }
}
