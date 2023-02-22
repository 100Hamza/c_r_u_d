import 'package:c_r_u_d/helper/navigation_helper.dart';
import 'package:c_r_u_d/presentation/elements/customtext.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? buttonName;
  VoidCallback? onPress;
  CustomButton({this.buttonName , this.onPress});
  @override
  Widget build(BuildContext context) {
    NavigationHelper nav = NavigationHelper();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.blue,
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 10.0,
      ),
        onPressed: onPress
        , child: CustomText(text: buttonName, size: 18,  textColor: Colors.white, weight: FontWeight.w300,));
  }
}
