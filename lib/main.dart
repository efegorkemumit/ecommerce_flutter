import 'package:ecommerce_flutter/constans/theme_data.dart';
import 'package:ecommerce_flutter/providers/theme_provider.dart';
import 'package:ecommerce_flutter/root_screen.dart';
import 'package:ecommerce_flutter/screens/auth/forgot_password.dart';
import 'package:ecommerce_flutter/screens/auth/login.dart';
import 'package:ecommerce_flutter/screens/auth/register.dart';
import 'package:ecommerce_flutter/screens/home_screen.dart';
import 'package:ecommerce_flutter/screens/init_screen/viewed_recently.dart';
import 'package:ecommerce_flutter/screens/init_screen/wishlist.dart';
import 'package:ecommerce_flutter/widgets/order/order_screen.dart';
import 'package:ecommerce_flutter/widgets/products/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_){
        return ThemeProvider();
      })

    ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child){
        return MaterialApp(
          title: 'Eccomerce Ap ',
          theme: Styles.themeData(isDarkTheme: themeProvider.getIsDarkTheme, context: context),

         home:const LoginScreen(),
          // home:const RootScreen(),
          routes: {
            ProductDetailScreen.routName : (context)=> const ProductDetailScreen(),
            WishlistScreen.routName : (context)=> const WishlistScreen(),
            ViewedRecentlyScreen.routName : (context)=> const ViewedRecentlyScreen(),
            RegisterScreen.routName : (context)=> const RegisterScreen(),
            OrderScreen.routName : (context)=> const OrderScreen(),
            ForgotPassword.routName : (context)=> const ForgotPassword(),


          },
        );

        
      }),

    );


  }
}
