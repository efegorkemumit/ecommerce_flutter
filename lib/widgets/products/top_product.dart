
import 'dart:developer';

import 'package:ecommerce_flutter/constans/app_constans.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class TopProductWidget extends StatelessWidget {
  const TopProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){
            log("to do add nav");
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
                        imageUrl: AppConstans.imageUrl,
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
                          "Title" *15,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              IconButton(onPressed: () {},
                                  icon: const Icon(IconlyBold.heart)
                              ),
                              IconButton(onPressed: () {},
                                  icon: const Icon(IconlyLight.bag)
                              ),
                            ],
                          ),
                        ),
                        const FittedBox(
                          child: SubTitleTextWidget(
                              label: "\$1000",
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
