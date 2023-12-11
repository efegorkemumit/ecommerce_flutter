import 'package:ecommerce_flutter/screens/cart/bottom_checkout.dart';
import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/screens/cart/cart_widget.dart';
import 'package:ecommerce_flutter/screens/cart/empty_bag.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routName = "/ViewedRecentlyScreen";

  const ViewedRecentlyScreen({super.key});
  final bool isEmpty = true;


  @override
  Widget build(BuildContext context) {
    return isEmpty ?
    Scaffold(
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
            title: const TitleTextWidget(label: "Viewed Recently")
        ),
        body: EmptyBagWidget(
            imagePath: AssetsManager.searchrecent,
            title: "Your Viewed Recently is empty",
            subtitle: "Like your Viewed Recently is empty",
            buttonText: "shop Now")
    )
        :Scaffold(
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
          title: const TitleTextWidget(label: "Viewed Recently")
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return const CardWidget();
      }),

    );
  }
}
