import 'package:flutter/material.dart';

class DialogNoti extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final String confirmText;
  final String cancelText;
  final Color confirmButtonColor;
  final Color cancelButtonColor;

  const DialogNoti({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmText = 'Xác nhận',
    this.cancelText = 'Hủy',
    this.confirmButtonColor = const Color.fromARGB(255, 15, 157, 134), 
    this.cancelButtonColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
        content,
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            cancelText,
            style: TextStyle(color: cancelButtonColor),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: confirmButtonColor,
          ),
          child: Text(confirmText, style: const TextStyle(color: Colors.white),
        ),
        ),
      ],
    );
  }
}