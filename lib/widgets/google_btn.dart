import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon
      (
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red
      ),

        onPressed: (){},
        icon: const Icon(Ionicons.logo_google),
        label:const Text("Sing in with google")
    );
  }
}
