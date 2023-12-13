import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/providers/product_provider.dart';
import 'package:ecommerce_flutter/screens/cart/cart_widget.dart';
import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/widgets/products/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routName = "/SearchScreen";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  late TextEditingController searchTextController;

  @override
  void initState(){
    searchTextController = TextEditingController();
    super.initState();
  }
  @override
  void dispose(){
    searchTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        FocusScope.of(context).unfocus();
                        searchTextController.clear();
                      });
                    },
                    child: const Icon(
                      Icons.clear,
                      color:Colors.red,
                    ),

                  ),

                ),
                onChanged: (value) {
                  // log("value of  text is $value");
                },
                onSubmitted: (value){
                 // log("${searchTextController}");
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(child: DynamicHeightGridView(
                mainAxisSpacing: 12,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                itemCount: productsProvider.getProducts.length,
                builder: (context, index){
                  return  ProductWidget(productId: productsProvider.getProducts[index].productId );
                },
              ))

            ],
          ),
        )
      ),
    );
  }
}
