import 'package:flutter/material.dart';

class UpdateProductTextFieldModel {
  final String hintText;
  final Function(String data) onChanged;

  final TextInputType keyboardType;

  UpdateProductTextFieldModel(
      {required this.hintText,
      required this.onChanged,
      this.keyboardType = TextInputType.emailAddress});
}
