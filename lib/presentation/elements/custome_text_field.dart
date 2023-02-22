import 'package:flutter/material.dart';

class CustomeTextTField extends StatelessWidget {
  TextEditingController? controller;
  bool? isPass;
  IconData? icon;
  String? label , hint;

  CustomeTextTField({this.controller , this.icon , this.isPass = false , this.hint , this.label});


  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.blue
      ),
      controller: controller,
      obscureText: isPass!,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        prefixIcon: Icon(icon),
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
