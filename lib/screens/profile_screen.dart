import 'package:ecommerce_flutter/screens/auth/login.dart';
import 'package:ecommerce_flutter/screens/init_screen/viewed_recently.dart';
import 'package:ecommerce_flutter/screens/init_screen/wishlist.dart';
import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/services/myapp_functions.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/widgets/order/order_screen.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_flutter/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return  Scaffold(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kullanıcı Giriş Uyarısı
          const Visibility(
              visible: false,
              child: Padding(padding: const EdgeInsets.all(8.0),
              child: TitleTextWidget(label: "label"),)
          ),
          Visibility(
            visible: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.background,
                          width: 3
                        ),

                      ),
                        child:ClipOval(
                          child: Image.asset(
                            AssetsManager.computer,
                            fit: BoxFit.fill,
                          ),
                        )
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        TitleTextWidget(label: "Efe Görkem Ümit"),
                        SizedBox(
                          height:6,
                        ),
                        SubTitleTextWidget(label: "Coding --- Youtube Efe Görkem Ümit")

                      ],

                    )
                  ],
                ),
              )


          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TitleTextWidget(
                      label: "Information"
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomListTile(
                      imagePath:
                      AssetsManager.bagimg2,
                      text: "All Orders",
                      function: () {
                        Navigator.pushNamed(context, OrderScreen.routName);

                      }
                  ),
                  CustomListTile(
                      imagePath:
                      AssetsManager.bagimg1,
                      text: "Favori",
                      function: () {
                        Navigator.pushNamed(context, WishlistScreen.routName);
                      }
                  ),
                  CustomListTile(
                      imagePath:
                      AssetsManager.clock,
                      text: "Viewed Recently",
                      function: () {
                        Navigator.pushNamed(context, ViewedRecentlyScreen.routName);
                      }
                  ),
                  CustomListTile(
                      imagePath:
                      AssetsManager.location,
                      text: "Address",
                      function: () {}
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  CustomListTile(
                      imagePath:
                      AssetsManager.privacy,
                      text: "Settings",
                      function: () {}
                  ),
                  const SizedBox(height: 10),
                  SwitchListTile(
                      title: Text(
                          themeProvider.getIsDarkTheme?"Dark Mode" : "LightM Mode"
                      ),
                      value: themeProvider.getIsDarkTheme,
                      onChanged: (value){
                        themeProvider.setDarkTheme(themeValue: value);
                      })
                ],

              ),
          ),

          Center(
            child: ElevatedButton.icon(

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),


                onPressed: () async {
                print("1");

                    if(user==null) {
                      Navigator.pushNamed(context, LoginScreen.routName);
                      print("2");
                    }
                    else
                      {
                        print("3");
                        await MyAppFunctions.showErrorOrWaningDialog(
                            context: context,
                            subtitle: "are you sure ? ",
                            fct: () async{
                              print("4");
                              await FirebaseAuth.instance.signOut();
                              if(!mounted) return;
                              Navigator.pushReplacementNamed(context, LoginScreen.routName);
                            },

                            isError : false
                        );

                      }


              },



                icon:  Icon(user==null ?  Icons.login : Icons.logout),
                label:  Text(user==null ? "Login" : "Logout")


            ),
          )

          
        ],
      ),
    );
  }
}


class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,

  });
  final String imagePath, text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
     onTap:(){
       function();
     },
    title: SubTitleTextWidget(label: text),
    leading: Image.asset(
        imagePath,
        height: 34,
    ),
      trailing:  const Icon(CupertinoIcons.chevron_right),

    );
  }
}
