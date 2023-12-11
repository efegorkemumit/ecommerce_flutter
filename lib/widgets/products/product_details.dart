import 'package:ecommerce_flutter/constans/app_constans.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routName = "/ProductDetailScreen";
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Scaffold(
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
        title: const AppNameTextWidget(fontSize: 20,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
                imageUrl: AppConstans.imageUrl,
                height: size.height * 0.35,
                width: double.infinity,

            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                            "Title"*20,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      const SubTitleTextWidget(
                          label: "\$1000.00",
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.red,
                      )

                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: kBottomNavigationBarHeight-10,
                                  child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0)
                                        ),
                                      ) ,
                                      onPressed: (){},
                                      icon: const Icon(Icons.shopping_cart),
                                      label: const Text("Add to cart")
                                  ),
                                ),

                            ),
                          ],


                      ),


                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      TitleTextWidget(label: "About this item"),
                      SubTitleTextWidget(label: "In shoes"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SubTitleTextWidget(label: "Description" *50 )

                ],
              )
            ),
          ],
        ),

      ),
    );
  }
}
