import 'package:flutter/material.dart';

class MultiLineTextField extends StatelessWidget {
  final String hintText;
  // final IconData icon;
  final TextEditingController controller;
  const MultiLineTextField({
    super.key,
    required this.hintText,
    required this.controller,
    // required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        filled: true,
        hintText: hintText,
        // prefixIcon: Icon(
        //   icon
        // ),
        border: InputBorder.none,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), // Define border when focused
        ),
      ),
    );
  }
}
