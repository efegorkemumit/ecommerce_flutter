import 'package:ecommerce_flutter/constans/validator.dart';
import 'package:ecommerce_flutter/root_screen.dart';
import 'package:ecommerce_flutter/screens/auth/forgot_password.dart';
import 'package:ecommerce_flutter/screens/auth/register.dart';
import 'package:ecommerce_flutter/services/myapp_functions.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/widgets/google_btn.dart';
import 'package:ecommerce_flutter/widgets/loading_manager.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';

class LoginScreen extends StatefulWidget {
  static const routName = "/LoginScreen";

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
  bool  _isLoading = false;
  final auth = FirebaseAuth.instance;

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

    if(isValid){
      try{
        setState(() {
          _isLoading=true;
        });
        await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim()
        );
        Fluttertoast.showToast(msg: "Login Successfull ", textColor: Colors.white);
        if(!mounted)
          return;
        Navigator.pushReplacementNamed(context, RootScreen.routName);
      }on FirebaseException catch( error){
        await MyAppFunctions.showErrorOrWaningDialog(
          context: context, subtitle: error.message.toString(), fct: (){},
        );

      }
      catch(error){
        await MyAppFunctions.showErrorOrWaningDialog(context: context, subtitle:
        error.toString(), fct: (){},);

      }
      finally{
        setState(() {
          _isLoading=false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: LoadingManager(isLoading: _isLoading, child: Padding(
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
                        obscureText: true,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, ForgotPassword.routName);

                          },
                          child: const SubTitleTextWidget(
                            label: "Forget Password",
                            fontStyle: FontStyle.italic,
                            textDecoration: TextDecoration.underline,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child:  ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                            )
                          ),
                            onPressed: () async { await _loginFct();},
                            icon: const Icon(Icons.login),
                            label: Text("Login")


                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      
                      SubTitleTextWidget(label: "Or Connect using"),

                      const SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        height: kBottomNavigationBarHeight  +10 ,
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: kBottomNavigationBarHeight,
                                  child:  FittedBox(
                                    child: GoogleButton(),
                                  ),
                                ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: kBottomNavigationBarHeight-15,
                                  child:  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(5.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(24.0)
                                          )
                                      ),
                                      onPressed: () async {

                                        Navigator.of(context).pushNamed(RootScreen.routName);
                                      },
                                      child: Text("Guest")


                                  ),
                                )
                            )
                          ],
                        ),
                      ),


                      const SizedBox(
                        height: 16.0,
                      ),

                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SubTitleTextWidget(label: "New Here ?"),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pushNamed(RegisterScreen.routName);
                            },
                            child: const SubTitleTextWidget(label: "Sign up" , fontStyle: FontStyle.italic ,))

                        ],
                      )

                    ],
                  ),
                )


              ],
            ),
          ),
        ),
        )
      ) ,
    );
  }
}
