import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final FocusNode? focusNode;

  const MyTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      ),
      controller: controller,
      focusNode: focusNode,
    );
  }
}
