import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:flutter/material.dart';

class DropDownWidget<T> extends StatefulWidget {
  final String title;
  final List<T> options;
  final String Function(T) itemToString;
  final ValueChanged<T?> onChanged;
  final T? value;
  final String? hintText;

  const DropDownWidget({
    super.key,
    required this.title,
    required this.options,
    required this.itemToString,
    required this.onChanged,
    this.value,
    this.hintText,
  });

  @override
  State<DropDownWidget<T>> createState() => _DropDownWidgetState<T>();
}

class _DropDownWidgetState<T> extends State<DropDownWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: AppFonts.fontSize16,
              fontWeight: AppFonts.fontWeight500,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.secondary.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              dropdownColor: AppColors.white,
              value: widget.value,
              hint: Text(
                widget.hintText ?? 'Chọn ${widget.title.toLowerCase()}',
              ),
              isExpanded: true,
              items:
                  widget.options.map((T item) {
                    return DropdownMenuItem<T>(
                      value: item,
                      child: Text(widget.itemToString(item)),
                    );
                  }).toList(),
              onChanged: widget.onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
