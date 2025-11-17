import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:flutter/material.dart';

class AccountManagementScreen extends StatefulWidget {
  const AccountManagementScreen({super.key});

  @override
  State<AccountManagementScreen> createState() =>
      _AccountManagementScreenState();
}

class _AccountManagementScreenState extends State<AccountManagementScreen> {
  final controller = TextEditingController();
  String selectedValue = "Tất cả";

  final List<String> items = [
    "Tất cả",
    "Kế toán",
    "Hướng dẫn viên",
    "Quản lý chuyến",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý tài khoản'),
        backgroundColor: AppColors.backgroundAppBarTheme,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchBarWidget(
                    controller: controller,
                    hintText: "Tìm kiếm nhân viên",
                  ),
                ),
                const SizedBox(width: 8),

                DropdownButton<String>(
                  value: selectedValue,
                  items:
                      items
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
              ],
            ),

            BkButton(onPressed: () {}, title: "Thêm"),
          ],
        ),
      ),
    );
  }
}
