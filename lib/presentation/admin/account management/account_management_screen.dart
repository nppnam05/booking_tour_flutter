import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/presentation/admin/account%20management/widget/account_card.dart';
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
    "Quản lý chuyến",
    "Kế toán",
    "Hướng dẫn viên",
    "Người tiếp nhận",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
            Expanded(
              child: ListView(
                children: [
                  AccountCardWidget(
                    name: "Nguyễn Thị Anh",
                    role: "Quản lý lịch trình",
                    phone: "0123456789",
                    onPermission: () {},
                    onDelete: () {},
                  ),
                  AccountCardWidget(
                    name: "Phạm Minh Quân",
                    role: "Kế toán",
                    phone: "0988776655",
                    onPermission: () {},
                    onDelete: () {},
                  ),
                  AccountCardWidget(
                    name: "Trần Hoàng Duy",
                    role: "Hướng dẫn viên",
                    phone: "0909123456",
                    onPermission: () {},
                    onDelete: () {},
                  ),
                  AccountCardWidget(
                    name: "Lê Mỹ Tiên",
                    role: "Quản lý chuyến",
                    phone: "0911223344",
                    onPermission: () {},
                    onDelete: () {},
                  ),
                  AccountCardWidget(
                    name: "Trần Hoàng Duy",
                    role: "Hướng dẫn viên",
                    phone: "0909123456",
                    onPermission: () {},
                    onDelete: () {},
                  ),
                  AccountCardWidget(
                    name: "Lê Mỹ Tiên",
                    role: "Quản lý chuyến",
                    phone: "0911223344",
                    onPermission: () {},
                    onDelete: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            BkButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "create_staff_account_part1_screen",
                );
              },
              title: "Thêm",
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
