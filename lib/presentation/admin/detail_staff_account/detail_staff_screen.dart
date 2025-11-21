import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:booking_tour_flutter/presentation/widgets_dialog/dialog_noti.dart';
import 'package:flutter/material.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';

class Staff {
  final String id;
  final String firstName;
  final String lastName;
  final String role;
  final String email;
  final String phone;
  final String dob;
  final String address;
  final String idNumber;
  final String idIssueDate;
  final String joinDate;
  final String jobStartDate;
  final String rank;
  final bool active;

  Staff({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.email,
    required this.phone,
    required this.dob,
    required this.address,
    required this.idNumber,
    required this.idIssueDate,
    required this.joinDate,
    required this.jobStartDate,
    required this.rank,
    required this.active,
  });

  String get fullName => '$firstName $lastName';
  String get initials {
    String a = firstName.isNotEmpty ? firstName[0] : '';
    String b = lastName.isNotEmpty ? lastName[0] : '';
    return (a + b).toUpperCase();
  }
}

class DetailStaffScreen extends StatelessWidget {
  final Staff staff;

  DetailStaffScreen({super.key, Staff? staff})
    : staff =
          staff ??
          Staff(
            id: 'NV2024001',
            firstName: 'Nguyễn Thị',
            lastName: 'Anh',
            role: 'Quản lý chuyến đi',
            email: 'nguyenanh@tourcompany.vn',
            phone: '0987654321',
            dob: '15/03/1992',
            address: '123 Nguyễn Huệ, Q1, TP.HCM',
            idNumber: '079123456789',
            idIssueDate: '20/02/2024',
            joinDate: '01/01/2023',
            jobStartDate: '01/01/2023',
            rank: 'Quản lý',
            active: true,
          );

  Widget _sectionCard({required String title, required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: AppColors.backgroundAppBarTheme,
                child: Icon(Icons.person, size: 16, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.backgroundAppBarTheme.withOpacity(0.1),
            child: Icon(icon, size: 16, color: AppColors.backgroundAppBarTheme),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(color: Colors.black54)),
          ),
          Expanded(flex: 3, child: Text(value, textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusText = staff.active ? 'Đang hoạt động' : 'Tạm khóa';
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundAppBarTheme,
        title: const Text('Chi tiết nhân viên'),
        leading: BackButton(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 34,
                    backgroundColor: AppColors.backgroundAppBarTheme,
                    child: Text(
                      staff.initials,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    staff.fullName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    staff.role,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      'ID: ${staff.id}',
                      style: const TextStyle(color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // thông tin cá nhân
            _sectionCard(
              title: 'Thông tin cá nhân',
              children: [
                _infoRow(Icons.email, 'Email', staff.email),
                _infoRow(Icons.phone, 'Số điện thoại', staff.phone),
                _infoRow(Icons.cake, 'Ngày sinh', staff.dob),
                _infoRow(Icons.location_on, 'Địa chỉ', staff.address),
                _infoRow(Icons.badge, 'CCCD/CMND', staff.idNumber),
                _infoRow(Icons.date_range, 'Ngày cấp CCCD', staff.idIssueDate),
              ],
            ),

            // thông tin công việc
            _sectionCard(
              title: 'Thông tin công việc',
              children: [
                _infoRow(Icons.calendar_today, 'Ngày vào làm', staff.joinDate),
                _infoRow(
                  Icons.calendar_today,
                  'Ngày nghỉ việc',
                  staff.jobStartDate,
                ),
                _infoRow(Icons.workspace_premium, 'Cấp bậc', staff.rank),
                _infoRow(Icons.check_circle_outline, 'Trạng thái', statusText),
              ],
            ),

            // Đánh giá (nếu là hướng dẫn viên mới có)
            _sectionCard(
              title: 'Đánh giá',
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Xem đánh giá',
                      style: TextStyle(color: AppColors.backgroundAppBarTheme),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            //  các nút chức năng
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: BkButton(onPressed: () {}, title: 'Phân quyền'),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: BkButton(
                      title: 'Tạm khóa',
                      backgroundColor: AppColors.orange,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Tạm khóa')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: BkButton(
                      title: 'Xóa nhân viên',
                      backgroundColor: AppColors.delete,
                      onPressed: () {
                        DialogNoti.confirm(
                          context: context,
                          title: "Xác nhận xóa",
                          message: "Bạn có chắc chắn muốn xóa tài khoản này?",
                          confirmText: "Xóa",
                          cancelText: "Hủy",
                        ).then((value) {
                          if (value) {
                            // TODO: hàm xóa nhân viên
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: BkButton(
                      title: 'Cập nhật',
                      backgroundColor: AppColors.borderButton,
                      onPressed: () {
                        // TODO: đến màn hình cập nhật
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cập nhật')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
