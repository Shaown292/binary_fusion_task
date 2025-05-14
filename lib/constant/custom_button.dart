import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String titleText;
  final Function()? onTap;
  const CustomButton({super.key, required this.onTap, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Color(0xFFA787FF), Color(0xFF4F1ED8),],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text(
            titleText,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ),
    );
  }
}