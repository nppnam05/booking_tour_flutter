import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/spiner_widget/select_dialog/select_dialog.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/spiner_widget/select_dialog/select_dialog_cubit.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final String title;
  final List<String> options;
  final SelectMode mode;
  final ValueChanged<List<String>> onChanged;

  const DropDownWidget({
    super.key,
    required this.title,
    required this.options,
    required this.onChanged,
    this.mode = SelectMode.single,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  List<String> selectedItems = [];

  Future<void> _openPopup() async {
    final result = await showDialog<List<String>>(
      context: context,
      builder:
          (context) => SelectDialog(
            title: widget.title,
            options: widget.options,
            mode: widget.mode,
            initialSelected: selectedItems,
          ),
    );

    if (result != null) {
      setState(() => selectedItems = result);
      widget.onChanged(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayText =
        selectedItems.isEmpty
            ? 'Chọn ${widget.title.toLowerCase()}'
            : selectedItems.join(', ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        InkWell(
          onTap: _openPopup,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(displayText)),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
