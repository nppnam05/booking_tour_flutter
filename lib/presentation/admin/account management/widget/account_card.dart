import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/presentation/admin/account%20management/widget/permission_dialog.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:booking_tour_flutter/presentation/widgets_dialog/dialog_noti.dart';
import 'package:flutter/material.dart';

class AccountCardWidget extends StatelessWidget {
  final String name;
  final String role;
  final String phone;
  final VoidCallback onDelete;
  final VoidCallback onPermission;

  const AccountCardWidget({
    super.key,
    required this.name,
    required this.role,
    required this.phone,
    required this.onDelete,
    required this.onPermission,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "detail_staff_screen");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFF1ABC9C),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    role,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                  Text(
                    phone,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BkButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (_) => PermissionDialog(
                            currentRole: "Quản lý chuyến",
                            onConfirm: (role) {
                              // TODO: xử lý cập nhật
                            },
                          ),
                    );
                  },
                  title: "Phân quyền",
                ),
                const SizedBox(height: 6),
                BkButton(
                  onPressed: () {
                    DialogNoti.confirm(
                      context: context,
                      title: "Xác nhận xóa",
                      message: "Bạn có chắc chắn muốn xóa tài khoản này?",
                      confirmText: "Xóa",
                      cancelText: "Hủy",
                    ).then((value) {
                      if (value) {
                        onDelete();
                      }
                    });
                  },
                  title: "Xóa",
                  backgroundColor: AppColors.delete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
