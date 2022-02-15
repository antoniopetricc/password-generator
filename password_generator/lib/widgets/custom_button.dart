import 'package:flutter/material.dart';
import 'package:password_generator/styles.dart';
import 'package:password_generator/widgets/ease_in.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const CustomButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EaseIn(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          color: Styles.kPrimary,
          borderRadius: Styles.kRadius,
        ),
        height: 56,
        width: 270,
        child: Center(
          child: Text(text, style: Styles.kSubtitle),
        ),
      ),
    );
  }
}
