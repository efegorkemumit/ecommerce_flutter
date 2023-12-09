import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_flutter/providers/theme_provider.dart';

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

          
        ],
      ),
    );
  }
}
