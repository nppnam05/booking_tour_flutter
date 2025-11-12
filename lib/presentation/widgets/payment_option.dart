import 'package:flutter/material.dart';

enum HinhThuc { thanhtoantoanbo, coc }

class PaymentRadioGroup extends StatefulWidget {
  final Function(HinhThuc) onChanged;

  PaymentRadioGroup({required this.onChanged});

  @override
  _PaymentRadioGroupState createState() => _PaymentRadioGroupState();
}

class _PaymentRadioGroupState extends State<PaymentRadioGroup> {
  HinhThuc? hinhThuc = HinhThuc.thanhtoantoanbo;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<HinhThuc>(
      groupValue: hinhThuc,
      onChanged: (HinhThuc? value) {
        setState(() {
          hinhThuc = value;
        });
        
        widget.onChanged(value!);
      },
      child: Column(
        children: [
          // Radio 1: Thanh toán toàn bộ
          buildRadioOption(
            value: HinhThuc.thanhtoantoanbo,
            icon: Icons.credit_card,
            iconColor: Colors.blue,
            label: 'Thanh toán toàn bộ',
          ),

          SizedBox(height: 12),

          // Radio 2: Đặt cọc
          buildRadioOption(
            value: HinhThuc.coc,
            icon: Icons.wallet,
            iconColor: Colors.orange,
            label: 'Đặt cọc',
          ),
        ],
      ),
    );
  }

  Widget buildRadioOption({
    required HinhThuc value,
    required IconData icon,
    required Color iconColor,
    required String label,
  }) {
    bool isSelected = hinhThuc == value;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isSelected ? Color(0xFF0D9488) : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RadioListTile<HinhThuc>(
        value: value,
        title: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        activeColor: Color(0xFF0D9488),
      ),
    );
  }
}
