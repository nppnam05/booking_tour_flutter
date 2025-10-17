import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onClear;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final double borderRadius;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onClear,
    this.onChanged,
    this.hintText = 'Tìm kiếm lịch trình',
    this.borderRadius = 24,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_update);
  }

  void _update() => setState(() {});

  @override
  void dispose() {
    widget.controller.removeListener(_update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: widget.controller,
                onChanged: widget.onChanged,
                style: const TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            if (widget.controller.text.isNotEmpty)
              IconButton(
                onPressed: widget.onClear,
                icon: const Icon(Icons.close, size: 18),
              )
            else
              const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
