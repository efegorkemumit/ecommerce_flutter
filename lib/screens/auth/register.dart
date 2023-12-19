import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/constans/validator.dart';
import 'package:ecommerce_flutter/root_screen.dart';
import 'package:ecommerce_flutter/services/myapp_functions.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/widgets/image_picker_widget.dart';
import 'package:ecommerce_flutter/widgets/loading_manager.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? _pickedImage;
  bool  _isLoading = false;
  final auth = FirebaseAuth.instance;
  String? userImageUrl;



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

  Future<void> _registerFCT() async {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_pickedImage == null) {
      MyAppFunctions.showErrorOrWaningDialog(
          context: context,
          subtitle: "Make sure to pick up an image",
          fct: () {});
      return;
    }
    if (isValid) {
      try {
        setState(() {
          _isLoading = true;
        });

        await auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        final User? user = auth.currentUser;
        final String uid = user!.uid;
        final ref = FirebaseStorage.instance
            .ref()
            .child("usersImages")
            .child("${_emailController.text.trim()}.jpg");
        await ref.putFile(File(_pickedImage!.path));
        userImageUrl = await ref.getDownloadURL();
        await FirebaseFirestore.instance.collection("users").doc(uid).set({
          'userId': uid,
          'userName': _nameController.text,
          'userImage': userImageUrl,
          'userEmail': _emailController.text.toLowerCase(),
          'createdAt': Timestamp.now(),
          'userWish': [],
          'userCart': [],
        });
        Fluttertoast.showToast(
          msg: "An account has been created",
          textColor: Colors.white,
        );
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, RootScreen.routName);
      } on FirebaseException catch (error) {
        await MyAppFunctions.showErrorOrWaningDialog(
          context: context,
          subtitle: error.message.toString(),
          fct: () {},
        );
      } catch (error) {
        await MyAppFunctions.showErrorOrWaningDialog(
          context: context,
          subtitle: error.toString(),
          fct: () {},
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> localImagePicker () async{
    final ImagePicker imagePicker = ImagePicker();
    await MyAppFunctions.ImagePickerDialog(
        context: context,
        cameraFCT: () async{
          _pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
        setState(() {

        });
        },
        galleryFCT: () async{
          _pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
          setState(() {

          });
        },
        removeFCT: (){
          setState(() {
            _pickedImage =null;
          });
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
                body:  LoadingManager(isLoading: _isLoading, child: Padding(
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

                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color:Colors.blue),
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child:
                              SizedBox(
                                  height: size.width * 0.3,
                                  width: size.width * 0.3,
                                  child: PickImageWidget(
                                      pickedImage: _pickedImage,
                                      function: ()  async{
                                        await localImagePicker();
                                      }

                                  )

                              ),


                            ),





                            const SizedBox(
                              height: 20,
                            ),


                            Form(
                              key: _formkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  TextFormField(
                                    controller: _nameController,
                                    focusNode: _nameFocusNode,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                        hintText: "Full name",
                                        prefixIcon: Icon ( Icons.person)
                                    ),
                                    onFieldSubmitted: (value){
                                      FocusScope.of(context).requestFocus(_emailFocusNode);
                                    },
                                    validator: (value){
                                      return MyValidators.displayNameValidator(value);
                                    },



                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),

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
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: obscureText,
                                    decoration:  InputDecoration(
                                        hintText: "Password",
                                        prefixIcon: Icon ( IconlyLight.password),
                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            setState(() {
                                              obscureText = !obscureText;
                                            });
                                          },
                                          icon: Icon(
                                            obscureText ? Icons.visibility
                                                :Icons.visibility_off
                                          ),
                                        )
                                    ),
                                    onFieldSubmitted: (value){
                                      FocusScope.of(context).requestFocus(_repeatPasswordFocuNode);
                                    },
                                    validator: (value){
                                      return MyValidators.PasswordValidator(value);
                                    },



                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),

                                  TextFormField(
                                    controller: _repeatPasswordController,
                                    focusNode: _repeatPasswordFocuNode,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: obscureText,
                                    decoration:  InputDecoration(
                                        hintText: "Repeat Password",
                                        prefixIcon: Icon ( IconlyLight.password),
                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            setState(() {
                                              obscureText = !obscureText;
                                            });
                                          },
                                          icon: Icon(
                                              obscureText ? Icons.visibility
                                                  :Icons.visibility_off
                                          ),
                                        )
                                    ),
                                    onFieldSubmitted: (value) async{
                                      await _registerFCT();

                                    },
                                    validator: (value){
                                      return MyValidators.PasswordValidator(value);
                                    },



                                  ),
                                  const SizedBox(
                                    height: 48.0,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child:  ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(16.0),
                                            backgroundColor: Colors.red,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12.0)
                                            )
                                        ),
                                        onPressed: () async { await _registerFCT();},
                                        icon: const Icon(Icons.save),
                                        label: Text("Sign up ")


                                    ),
                                  ),


                                ],
                              ),
                            )
    ]
    ),
    ),
    ),
    )
        )
    );
  }
}
