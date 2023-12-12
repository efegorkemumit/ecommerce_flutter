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
  bool obscureText =true;
  late final TextEditingController _nameController,
      _emailController,
      _passwordController,
      _repeatPasswordController;

  late final FocusNode _nameFocusNode, _emailFocusNode, _passwordFocusNode,
    _repeatPasswordFocuNode;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState(){
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();

    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _repeatPasswordFocuNode = FocusNode();

    super.initState();

  }

  @override
  void dispose(){
    if(mounted){

      _nameController.dispose();
      _emailController.dispose();
      _passwordController.dispose();
      _repeatPasswordController.dispose();

      _nameFocusNode.dispose();
      _emailFocusNode.dispose();
      _passwordFocusNode.dispose();
      _repeatPasswordFocuNode.dispose();


    }
    super.dispose();

  }

  Future<void> registerFCT() async{
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
  }


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
