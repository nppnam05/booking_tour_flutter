import 'package:flutter/material.dart';

class ToggleInputField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final Color color;

  const ToggleInputField({super.key, required this.controller, required this.text, required this.color});

  @override
  State<ToggleInputField> createState() => _ToggleInputFieldState();
}

class _ToggleInputFieldState extends State<ToggleInputField> {
  // Trạng thái để kiểm soát việc ẩn/hiện mật khẩu
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text, style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0),

        TextField(
          controller: widget.controller,

          // Điều khiển ẩn/hiện mật khẩu
          obscureText: _obscureText,

          decoration: InputDecoration(
            filled: true,
            fillColor: widget.color,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),

            hintText: widget.text,

            // Biểu tượng con mắt có chức năng
            suffixIcon: IconButton(
              icon: Icon(
                // Thay đổi icon dựa trên trạng thái _obscureText
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                // Đảo ngược trạng thái khi click
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}


