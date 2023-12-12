


import 'package:ecommerce_flutter/services/assets_manages.dart';
import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class MyAppFunctions{
  static Future<void> showErrorOrWaningDialog({
    required BuildContext context,
    required String subtitle,
    bool isError = true,
    required Function fct,

}) async
  {
    await showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            content: Column(
              children: [
                Image.asset(
                    isError ? AssetsManager.error : AssetsManager.warning,
                    height: 60,
                    width: 60,
                ),
                const SizedBox(
                  height: 16.0,),
                SubTitleTextWidget(label: subtitle, fontWeight: FontWeight.w600,),
                const SizedBox(
                  height: 16.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],


                )

              ],
              


            ),
          );


        }

    );


  }
 }