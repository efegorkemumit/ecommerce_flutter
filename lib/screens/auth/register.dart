import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const routName = "/RegisterScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
                body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                      child: Column(
                          children: [
                          const SizedBox(
                          height: 50,
                          ),
                          const AppNameTextWidget(
                          fontSize: 20,
                          ),
                          const SizedBox(
                          height: 60,
                          ),
                          const Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              TitleTextWidget(label: "Welcome"),
                              SubTitleTextWidget(label: "Your Welcome message hello")
                            ],
                          )
                              
                              
                          ),
                          const SizedBox(
                          height: 20,
                          ),
    ]
    ),
    ),
    ),
    )
    );
  }
}
