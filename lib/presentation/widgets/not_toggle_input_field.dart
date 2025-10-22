import 'package:flutter/material.dart';

Widget notToggleInputField(TextEditingController controller, String text, Color color) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8.0),
      TextField(
        controller: controller,

        decoration: InputDecoration(
          filled: true,
          fillColor: color,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),

          hintText: text,

          //  Biểu tượng người dùng
          suffixIcon: const Icon(Icons.person_outline, color: Colors.grey),
        ),
      ),
    ],
  );
}
