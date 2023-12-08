import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';

class ProfileScreem extends StatelessWidget {
  const ProfileScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TitleTextWidget(label: "Profile Screen"),
      ),
    );
  }
}
