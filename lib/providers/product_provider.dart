import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';


class ProductProvider with ChangeNotifier{
  List<ProductModel> products = [];
  List<ProductModel> get getProducts{
    return products;
  }
  ProductModel ? findByProId(String productId){
    if(products.where((element) => element.productId == productId).isEmpty){
      return null;
    }
    return products.firstWhere((element) => element.productId==productId);
  }

  List<ProductModel> findByCategory ({required String categoryName}){
    List<ProductModel> categoryList = products
        .where((element) => element.productCategory.toLowerCase().contains(
      categoryName.toLowerCase(),
    )).toList();
    return categoryList;
  }

  List<ProductModel> searchQuery (
      {required String searchText, required List<ProductModel> passedList}
      ){
    List<ProductModel> searchList = passedList.
    where((element) => element.productTitle.toLowerCase().contains(
      searchText.toLowerCase(),
    )).toList();
    return searchList;


  }
  
  final productDb = FirebaseFirestore.instance.collection("products");
  Future<List<ProductModel>> fetchProducts () async {

    try{
      await productDb.get().then((productSnapshot) {
        products.clear();

        for (var element in productSnapshot.docs){
          products.insert(0, ProductModel.fromFirestore(element));
        }



      });
      notifyListeners();
      return products;
    }catch(e)
    {
      rethrow;
    }



  }

}