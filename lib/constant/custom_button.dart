import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String titleText;
  final Function()? onTap;
  final double? height;
  final double? width;
  final Color? color;
  final LinearGradient? linearGradient;

  const CustomButton({super.key, required this.onTap, required this.titleText, this.height, this.width, this.color, this.linearGradient});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 60,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          gradient: linearGradient ?? LinearGradient(
            colors: [Color(0xFFA787FF), Color(0xFF4F1ED8),],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text(
            titleText,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
      ),
    );
  }
}