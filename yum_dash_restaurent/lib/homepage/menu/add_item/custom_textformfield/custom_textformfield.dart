import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  const CustomTextFormField(
      {super.key, required this.hintText, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => checkValidation(value),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }

  checkValidation(String? value) {
    return value!.isEmpty ? 'please enter data' : null;
  }
}
