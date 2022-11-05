import 'package:flutter/material.dart';

import '../contants/globalvaribles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final int maxLines;
  final VoidCallback ? onTap;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.prefixIconData,
    this.suffixIconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(

          hintText: hintText,
      hintStyle: TextStyle(
        color: Globalvariables.primaryColor,
        fontSize: 14,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Globalvariables.primaryColor,
          width: 1.5,
        )
      )
          ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}