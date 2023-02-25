import 'package:flutter/material.dart';

class Custom_TextField extends StatelessWidget {
  int? maxLines;
  String? label , hint;
  TextEditingController? controller;
  Custom_TextField({this.maxLines , this.label, this.hint , this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines ,
      style: TextStyle(
          color: Colors.blue
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        labelText: label,
        floatingLabelAlignment: FloatingLabelAlignment.center,
        hintText: hint,
      ),
    );
  }
}
