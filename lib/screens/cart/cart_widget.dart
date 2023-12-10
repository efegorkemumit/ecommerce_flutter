import 'package:ecommerce_flutter/screens/cart/quantity_btm_sheet.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:iconly/iconly.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(12.0),
               child: FancyShimmerImage(
                 imageUrl: 'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
                 height: size.height*0.2,
                 width: size.height*0.2,
               ),
             ),
              const SizedBox(
                width: 10,
              ),
              IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width*0.6,
                          child: TitleTextWidget(
                            label: "Title" *15,

                          ),
                        ),
                        Column(
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.clear, color:Colors.red)),
                            IconButton(onPressed: (){}, icon: const Icon(IconlyLight.heart))

                          ],
                        )
                      ],

                    ),
                    Row(
                      children: [
                        const SubTitleTextWidget(label: "16.00\$", color: Colors.blue),
                        const Spacer(),
                        OutlinedButton.icon(
                          onPressed: () async{
                            await showModalBottomSheet(
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  )

                                ),

                                context: context,
                                builder: (context){
                                  return const QuantityBottomSheetWidget();

                                },
                            );
                          },
                          icon: const Icon(IconlyLight.arrow_down_2),
                          label: const Text("QTY : 6"),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)
                            )
                          ),
                        ),
                      ],


                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),



    ) ;
  }
}
