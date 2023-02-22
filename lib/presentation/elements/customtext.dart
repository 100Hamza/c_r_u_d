import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  Color? textColor;
  double? size , space;
  FontWeight? weight;


  CustomText({this.text, this.textColor, this.size, this.space, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
        color: textColor,
        fontSize: size,
        fontWeight: weight,
        letterSpacing: space,
    ),
    );
  }
}
