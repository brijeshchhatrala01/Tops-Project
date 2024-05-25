import 'package:flutter/material.dart';

import '../theme/colors.dart';

//custom TextFormFields
class CustomTextFormFields extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? onPressed;
  const CustomTextFormFields({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.onPressed,
  });

  String? validationCheck(String? value) {
    return value!.isEmpty ? "Please Enter Require Data!" : null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: textFormFieldColor,
      obscureText: obscureText,
      validator: validationCheck,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textFormFieldColor, width: 1)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textFormFieldColor, width: 1)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textFormFieldColor, width: 1)),
        errorStyle: const TextStyle(color: textFormFieldColor),
        hintText: hintText,
        focusColor: textFormFieldColor,
        prefixIconColor: textFormFieldColor,
        fillColor: textFormFieldColor,
        suffixIconColor: textFormFieldColor,
        suffixIcon: IconButton(onPressed: onPressed, icon: Icon(suffixIcon)),
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}

//medium sizedbox
const SizedBox mediumSizedBox = SizedBox(
  height: 18,
);

const SizedBox smallSizedBox = SizedBox(
  height: 12,
);
