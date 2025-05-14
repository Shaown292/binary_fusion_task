import 'package:binary_fusion_task/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData iconData;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const CustomTextField(
      {super.key, required this.iconData, required this.hintText, required this.controller, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusColor: Colors.purple[500],
        hoverColor: Color(0xFF7A5AF8),
        hintText: hintText,
        hintStyle: AppTextStyle.inter13w400Grey,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Icon(iconData),
        ),
        prefixIconColor: Colors.purple[400],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      style: TextStyle(fontSize: 18),
      obscureText: obscureText,
    );
  }
}
