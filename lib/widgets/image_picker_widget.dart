import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
    this.pickedImage,
    required this.function
  });

  final XFile? pickedImage;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
            padding : const EdgeInsets.all(100),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),

              child: pickedImage == null
                  ? Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(25.0)
                ),
              )
                  :Image.file(
                File(pickedImage!.path),
                fit: BoxFit.fill,
              ),

            ),


        ),

      ],
    );
  }
}
