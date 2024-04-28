import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isNumber;
  final TextEditingController controller;
  const MyTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      validator: (value) {
        if (isNumber) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          final rating = int.tryParse(value);
          if (rating == null || rating < 1 || rating > 10) {
            return 'Rating must be between 1 and 10';
          }
        }
        return null;
      },
      keyboardType: isNumber? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        filled: true,
        hintText: hintText,
        border: InputBorder.none,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), // Define border when focused
        ),
        prefixIcon: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),

        ),
      );
  }
}
