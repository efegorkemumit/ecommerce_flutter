import 'package:ecommerce_flutter/constans/validator.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState(){
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose(){
    if(mounted){
      _emailController.dispose();
      _passwordController.dispose();

      _emailFocusNode.dispose();
      _passwordFocusNode.dispose();
    }
    super.dispose();

  }

  Future<void> _loginFct() async{
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
                  alignment: Alignment.centerLeft,
                  child: TitleTextWidget(label: "Welcome back"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key:_formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email Adress",
                          prefixIcon: Icon ( IconlyLight.message)
                        ),
                        onFieldSubmitted: (value){
                          FocusScope.of(context).requestFocus(_passwordFocusNode);
                        },
                        validator: (value){
                          return MyValidators.EmailValidator(value);
                        },



                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                            hintText: "*********",
                            prefixIcon: Icon ( IconlyLight.password)
                        ),
                        onFieldSubmitted: (value) async {
                          await _loginFct();
                        },
                        validator: (value){
                          return MyValidators.PasswordValidator(value);
                        },



                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
        ),

      ) ,
    );
  }
}
