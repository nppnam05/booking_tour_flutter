import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:flutter/material.dart';

class BkButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color? backgroundColor;

  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const BkButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor = AppColors.backgroundAppBarTheme,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
      ),
      child: Text(title, style: textStyle),
    );
  }
}
