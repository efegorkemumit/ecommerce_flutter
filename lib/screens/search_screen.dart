import 'dart:developer';

import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
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

            ],
          ),
        )
      ),
    );
  }
}
