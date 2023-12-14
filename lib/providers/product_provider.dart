import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';


class ProductProvider with ChangeNotifier{
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

  List<ProductModel> searchQuery ({required String searchText}){
    List<ProductModel> searchList = products.
    where((element) => element.productTitle.toLowerCase().contains(
      searchText.toLowerCase(),
    )).toList();
    return searchList;


  }

  List <ProductModel> products = [
    ProductModel(
      //1
      productId: 'iphone14-64-black',
      productTitle: "Apple iPhone 14 Pro (128GB) - Black",
      productPrice: "299.99",
      productCategory: "shoes",
      productDescription:
      "6.1-inch  magical way to interact with your .  mode, for  on the move. Accident detection, vital safety technology that calls for help for you. All-day battery life and up to 23 hours of video playback.",
      productImage: "https://i.ibb.co/BtMBSgK/1-iphone14-128gb-black.webp",
      productQuantity: "10",
    ),
    ProductModel(
      //2
      productId: 'samsung-galaxy-s22-ultra',
      productTitle: "Samsung Galaxy S22 Ultra (256GB) - Phantom Black",
      productPrice: "1299.99",
      productCategory: "books",
      productDescription:
      "Introducing the Samsung Galaxy S22 Ultra with a stunning 6.8-inch Dynamic AMOLED display. Capture every moment with the 108MP camera. Enjoy the power of the latest Exynos processor and a massive 5000mAh battery. The sleek Phantom Black design adds a touch of elegance to your mobile experience.",
      productImage: "https://i.ibb.co/nbwTvXQ/2-iphone13-mini-256gb-midnight.webp",
      productQuantity: "15",
    ),

    ProductModel(
      //3
      productId: 'macbook-air-m2-512gb',
      productTitle: "Apple MacBook Air M2 (512GB) - Space Gray",
      productPrice: "1599.99",
      productCategory: "Laptops",
      productDescription:
      "Experience the incredible performance of the Apple MacBook Air M2. Powered by the latest M2 chip, this laptop delivers unparalleled speed and efficiency. The 13.3-inch Retina display offers stunning visuals, while the sleek Space Gray design adds a touch of sophistication.",
      productImage: "https://i.ibb.co/G7nXCW4/3-i-Phone-14.jpg",
      productQuantity: "8",
    ),

    ProductModel(
      //4
      productId: 'sony-noise-cancelling-headphones',
      productTitle: "Sony WH-1000XM5 Noise-Cancelling Headphones",
      productPrice: "299.99",
      productCategory: "Audio",
      productDescription:
      "Immerse yourself in music with the Sony WH-1000XM5 headphones. Industry-leading noise cancellation technology ensures a distraction-free listening experience. Enjoy the rich sound quality and all-day comfort. Touch controls make it easy to manage your music and calls.",
      productImage: "https://i.ibb.co/z5zMDCx/4-Samsung-Galaxy-S22-Ultra-5-G-256-GB-Phantom-Black-Unlocked.webp",
      productQuantity: "20",
    ),

    ProductModel(
      //5
      productId: 'nintendo-switch-pro',
      productTitle: "Nintendo Switch Pro - OLED Model",
      productPrice: "349.99",
      productCategory: "Gaming",
      productDescription:
      "Upgrade your gaming experience with the Nintendo Switch Pro. The vibrant 7-inch OLED screen provides crisp visuals, and the enhanced audio ensures immersive gameplay. With the new NVIDIA custom processor, enjoy faster and smoother performance in your favorite games.",
      productImage: "https://i.ibb.co/ww5WjkV/5-Samsung-Galaxy-S21-Ultra-5-G.png",
      productQuantity: "12",
    ),
    ProductModel(
      //7
      productId: 'lg-4k-ultra-hd-smart-tv',
      productTitle: "LG 4K Ultra HD Smart TV (65 inches)",
      productPrice: "999.99",
      productCategory: "TVs",
      productDescription:
      "Transform your entertainment experience with the LG 4K Ultra HD Smart TV. Enjoy lifelike picture quality on the 65-inch display. Smart TV features allow you to access your favorite streaming services with ease. ThinQ AI technology enhances your viewing experience.",
      productImage: "https://i.ibb.co/0yhgKVv/6-One-Plus-9-Pro-5-G-LE2120-256-GB-12-GB-RAM.png",
      productQuantity: "5",
    ),

    ProductModel(
      //8
      productId: 'fitbit-charge-5-fitness-tracker',
      productTitle: "Fitbit Charge 5 Fitness Tracker",
      productPrice: "149.99",
      productCategory: "Wearables",
      productDescription:
      "Achieve your fitness goals with the Fitbit Charge 5. Track your heart rate, sleep, and activity levels with precision. The vibrant AMOLED display provides real-time stats and notifications. With built-in GPS, explore new routes and monitor your progress.",
      productImage: "https://i.ibb.co/NstFstg/7-Samsung-Galaxy-Z-Flip3-5-G.png",
      productQuantity: "18",
    ),

    ProductModel(
      //9
      productId: 'canon-eos-r5-mirrorless-camera',
      productTitle: "Canon EOS R5 Mirrorless Camera",
      productPrice: "3499.99",
      productCategory: "Cameras",
      productDescription:
      "Unleash your creativity with the Canon EOS R5 Mirrorless Camera. Capture stunning, high-resolution images with the 45MP full-frame sensor. Advanced autofocus and in-body image stabilization ensure sharp and steady shots. 8K video recording for cinematic masterpieces.",
      productImage: "https://i.ibb.co/8P1HBm4/8-iphone14plushereo.jpg",
      productQuantity: "7",
    ),

  ];
}