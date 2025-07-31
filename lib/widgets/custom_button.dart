
// lib/widgets/custom_button.dart
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: ElevatedButton(

        onPressed: onPressed,

        style: ElevatedButton.styleFrom(

          minimumSize: const Size(double.infinity, 48),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),


        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}