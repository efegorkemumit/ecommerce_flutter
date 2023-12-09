import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_flutter/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        title: const Text("Profile Screen"),
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
                      function: () {}
                  ),
                  CustomListTile(
                      imagePath:
                      AssetsManager.bagimg1,
                      text: "Favori",
                      function: () {}
                  ),
                  CustomListTile(
                      imagePath:
                      AssetsManager.clock,
                      text: "Viewed Recently",
                      function: () {}
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
                  borderRadius: BorderRadius.circular(30.0)
                )
              ),
                
                
                onPressed: (){}, icon: const Icon(Icons.login), label: const Text("Login")),
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
