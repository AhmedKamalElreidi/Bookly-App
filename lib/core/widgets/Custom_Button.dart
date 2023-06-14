// ignore_for_file: file_names

import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgoundColor,
    required this.textColor,
    this.borderRadius,
    required this.text, this.onPressed,
  });

  final Color backgoundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgoundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        child: Text(text,
            style: Styles.textStyle18
                .copyWith(color: textColor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
