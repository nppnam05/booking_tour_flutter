import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget notIconToggleInputField(
  TextEditingController controller,
  String label,
  String text,
  Color color, {
  ValueChanged<String>? onChanged,
  bool isNumber = false,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          inputFormatters: isNumber? [FilteringTextInputFormatter.digitsOnly]: [],
          decoration: InputDecoration(
            hintText: text,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    ),
  );
}
