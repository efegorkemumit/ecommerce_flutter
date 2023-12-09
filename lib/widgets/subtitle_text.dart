
import 'package:flutter/material.dart';

class SubTitleTextWidget extends StatelessWidget {
  const SubTitleTextWidget({super.key,
    required this.label,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.color,
    this.textDecoration = TextDecoration.none

  });


  final String label;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
        label,
        style:TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: textDecoration,
          color: color,
          fontStyle: fontStyle,


        )
    );
  }
}
