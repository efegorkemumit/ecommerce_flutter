import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_flutter/constans/app_constans.dart';
import 'package:ecommerce_flutter/providers/product_provider.dart';
import 'package:ecommerce_flutter/providers/theme_provider.dart';
import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/widgets/products/category_roundend_widget.dart';
import 'package:ecommerce_flutter/widgets/products/product_widget.dart';
import 'package:ecommerce_flutter/widgets/products/top_product.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final productsProvider = Provider.of<ProductProvider>(context);

    Size size  = MediaQuery.of(context).size;
    return Scaffold(
      // APPBAR ------------------->
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
              AssetsManager.card
          ),

        ),
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: size.height *0.25,
              child: ClipRRect(
                child: Swiper(
                  itemBuilder: (BuildContext context, int index){
                    return Image.asset(
                      AppConstans.bannerImages[index],
                      fit:BoxFit.fill,
                    );

                  },
                  itemCount: AppConstans.bannerImages.length,
                  pagination: SwiperPagination(
                     builder: DotSwiperPaginationBuilder(
                       activeColor: Colors.red, color: Colors.green
                     )
                  ),

                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Visibility(visible:productsProvider.getProducts.isNotEmpty, child:
             TitleTextWidget(label: "Top Product"),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Visibility(visible:productsProvider.getProducts.isNotEmpty,
              child: SizedBox(
              height: size.height* 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: productsProvider.getProducts.length < 5 ? productsProvider.getProducts.length : 5,
                  itemBuilder: (context, index){
                     return ChangeNotifierProvider.value(
                         value: productsProvider.getProducts[index],
                       child: const TopProductWidget(),

                     );
                  }
              ),
            ),
        ),
            const TitleTextWidget(label: "Categories"),
            const SizedBox(
              height: 15.0,
            ),
            GridView.count(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
              children:
                List.generate(AppConstans.categoriesList.length, (index) {
                  return CategoryRoundenWidget(
                      image: AppConstans.categoriesList[index].image,
                      name: AppConstans.categoriesList[index].name,
                  );

                }),
            ),
          ],
        )
        ),
      ),
    );
  }
}
