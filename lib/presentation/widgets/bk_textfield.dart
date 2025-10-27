import 'package:flutter/material.dart';

class BkTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final Color? fillColor;
  final String hint;

  const BkTextfield({
    super.key,
    required this.controller,
    required this.title,
    this.fillColor,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        const SizedBox(height: 8.0),

        TextField(
          controller: controller,
          decoration: const InputDecoration()
              .applyDefaults(Theme.of(context).inputDecorationTheme)
              .copyWith(hintText: hint, fillColor: fillColor),
        ),
      ],
    );
  }
}
