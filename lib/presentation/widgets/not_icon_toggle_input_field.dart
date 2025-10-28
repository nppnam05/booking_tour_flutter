import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:flutter/material.dart';

Widget notIconToggleInputField(
  TextEditingController controller,
  String text,
  Color color, {
  ValueChanged<String>? onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8.0),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.gray, width: 1.5),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: text,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: onChanged,
        ),
      ),
    ],
  );
}
