import 'package:flutter/material.dart';

import 'CustomWidgetsModels/UpdateProductTextFieldModel.dart';

class UpdateProductTextField extends StatelessWidget {
  final UpdateProductTextFieldModel updateProductTextFieldModel;

  const UpdateProductTextField({
    super.key,
    required this.updateProductTextFieldModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: updateProductTextFieldModel.onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: updateProductTextFieldModel.hintText),
      ),
    );
  }
}
