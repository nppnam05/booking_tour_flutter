import 'package:flutter/material.dart';

class DeleteButtonWidget extends StatelessWidget {
  final VoidCallback onDelete;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  const DeleteButtonWidget({
    super.key,
    required this.onDelete,
    this.text = 'Xóa',
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onDelete,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
