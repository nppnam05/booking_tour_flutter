import 'package:booking_tour_flutter/app/dependency_injection/format_date_number.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/admin/account_management/cubit/account_management_cubit.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:booking_tour_flutter/presentation/widgets_dialog/dialog_noti.dart';
import 'package:flutter/material.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_tour_flutter/domain/staff.dart';

class DetailStaffScreen extends StatelessWidget {
  final Staff? staff;

  const DetailStaffScreen({super.key, this.staff});

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
    final selectedStaff =
        staff ?? context.watch<AccountManagementCubit>().state.selectedStaff;

    if (selectedStaff == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundAppBarTheme,
          title: const Text('Chi tiết nhân viên'),
          leading: BackButton(color: AppColors.white),
          elevation: 0,
        ),
        body: const Center(child: Text('Không tìm thấy dữ liệu nhân viên')),
      );
    }

    final staffData = selectedStaff;
    final statusText = staffData.isActive ? 'Đang hoạt động' : 'Tạm khóa';
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundAppBarTheme,
        title: const Text('Chi tiết nhân viên'),
        leading: BackButton(color: AppColors.white),
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
                    child: const Icon(
                      Icons.person,
                      size: 28,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    staffData.user.name,
                    style: const TextStyle(
                      fontSize: AppFonts.fontSize18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    staffData.role.title,
                    style: const TextStyle(color: AppColors.gray),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      'ID: ${staffData.user.id}',
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
                _infoRow(Icons.email, 'Email', staffData.user.email),
                _infoRow(Icons.phone, 'Số điện thoại', staffData.user.phone),
                _infoRow(
                  Icons.cake,
                  'Ngày sinh',
                  formatDate(staffData.dateOfBirth),
                ),
                _infoRow(Icons.location_on, 'Địa chỉ', staffData.address),
                _infoRow(Icons.badge, 'CCCD/CMND', staffData.cccd),
                _infoRow(
                  Icons.date_range,
                  'Ngày cấp CCCD',
                  formatDate(staffData.cccdIssueDate),
                ),
              ],
            ),

            // thông tin công việc
            _sectionCard(
              title: 'Thông tin công việc',
              children: [
                _infoRow(
                  Icons.calendar_today,
                  'Ngày vào làm',
                  formatDate(staffData.startWorkingDate),
                ),
                if (!staffData.isActive)
                  _infoRow(
                    Icons.calendar_today,
                    'Ngày nghỉ việc',
                    formatDate(staffData.endWorkingDate),
                  ),
                _infoRow(
                  Icons.workspace_premium,
                  'Cấp bậc',
                  staffData.role.title,
                ),
                _infoRow(Icons.check_circle_outline, 'Trạng thái', statusText),
              ],
            ),

            // Đánh giá (chỉ hiển thị nếu là hướng dẫn viên)
            if (staffData.role.title.toLowerCase() == 'tour guide')
              _sectionCard(
                title: 'Đánh giá',
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Xem đánh giá',
                        style: TextStyle(
                          color: AppColors.backgroundAppBarTheme,
                        ),
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

            if (staffData.role.title.toLowerCase() == 'hướng dẫn viên')
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
                        ).then((value) async {
                          if (value) {
                            final cubit =
                                context.read<AccountManagementCubit>();
                            final success = await cubit.deleteStaff(
                              staffData.userId,
                            );

                            if (!context.mounted) return;

                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Xóa nhân viên thành công'),
                                ),
                              );
                              Navigator.of(context).popUntil(
                                (route) =>
                                    route.settings.name ==
                                    RouteName.accountManagement,
                              );
                            } else {
                              final error =
                                  context
                                      .read<AccountManagementCubit>()
                                      .state
                                      .error;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    error ?? 'Xóa nhân viên thất bại',
                                  ),
                                ),
                              );
                            }
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
                        context.read<AccountManagementCubit>().setSelectedStaff(
                          staffData,
                        );
                        Navigator.pushNamed(
                          context,
                          'update_staff_account_screen',
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
