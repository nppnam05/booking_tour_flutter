import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:flutter/material.dart';

class BkButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color backgroundColor;
  final Color? borderColor;

  final Color? textColor;
  final EdgeInsetsGeometry? padding;

  final bool isShowError;
  final String? errorMessage;

  const BkButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor = AppColors.backgroundAppBarTheme,
    this.padding,
    this.textColor = AppColors.white,
    this.borderColor,
    this.isShowError = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    var isError = isShowError && errorMessage != null;
    Color? nowBorderColor =
        isError ? AppColors.error : borderColor ?? backgroundColor;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
          side: BorderSide(color: nowBorderColor),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: textColor),
      ),
    );
  }
}
