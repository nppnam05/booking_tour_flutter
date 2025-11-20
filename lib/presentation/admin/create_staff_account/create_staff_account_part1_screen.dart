import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/text_input.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:booking_tour_flutter/presentation/widgets/toggle_Input_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateStaffAccountPart1Screen extends StatefulWidget {
  const CreateStaffAccountPart1Screen({super.key});

  @override
  State<CreateStaffAccountPart1Screen> createState() =>
      _CreateStaffAccountPart1ScreenState();
}

class _CreateStaffAccountPart1ScreenState
    extends State<CreateStaffAccountPart1Screen> {
  final accountCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  final nameCtrl = TextEditingController();
  final cccdCtrl = TextEditingController();
  final issuedDateCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  final startDateCtrl = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirm = true;

  String selectedRole = "--Quyền truy cập--";
  final roles = [
    "--Quyền truy cập--",
    "Quản lý chuyến",
    "Kế toán",
    "Hướng dẫn viên",
    "Người tiếp nhận",
  ];

  Future<void> _pickDate(TextEditingController ctrl) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      ctrl.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  @override
  void dispose() {
    accountCtrl.dispose();
    passwordCtrl.dispose();
    confirmCtrl.dispose();
    nameCtrl.dispose();
    cccdCtrl.dispose();
    issuedDateCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    addressCtrl.dispose();
    dobCtrl.dispose();
    startDateCtrl.dispose();
    super.dispose();
  }

  Widget _sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.info_outline, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: AppFonts.fontSize20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration([String? hint]) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 12.0,
      ),
      isDense: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundAppBarTheme,
        title: const Text('Tạo tài khoản'),
        leading: BackButton(color: Colors.white),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                // Avatar
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: AppColors.backgroundAppBarTheme,
                        child: const Text(
                          'NTA',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),

                // Card  thông tin tài khoản
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle("Thông tin tài khoản"),
                      const SizedBox(height: 8),

                      // Tài khoản
                      TextInput(
                        controller: accountCtrl,
                        hintText: 'Tài khoản',
                        labelText: 'Tài khoản',
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Vui lòng nhập tài khoản';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),

                      ToggleInputField(
                        controller: passwordCtrl,
                        title: "Mật khẩu",
                        color: AppColors.scaffoldBackgroundColor,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Vui lòng nhập mật khẩu';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),

                      // Nhập lại mật khẩu
                      ToggleInputField(
                        controller: confirmCtrl,
                        title: "Nhập lại mật khẩu",
                        color: AppColors.scaffoldBackgroundColor,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Vui lòng nhập lại mật khẩu';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),

                      // Quyền truy cập
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quyền truy cập",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFonts.fontSize14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: selectedRole,
                            items:
                                roles
                                    .map(
                                      (r) => DropdownMenuItem(
                                        value: r,
                                        child: Text(r),
                                      ),
                                    )
                                    .toList(),
                            onChanged:
                                (v) => setState(() {
                                  selectedRole = v ?? roles.first;
                                }),
                            decoration: _inputDecoration('--Quyền truy cập--'),
                          ),
                        ],
                      ),

                      // thông tin cá nhân
                      const SizedBox(height: 16),
                      _sectionTitle("Thông tin cá nhân"),
                      const SizedBox(height: 8),

                      // Họ và tên
                      TextInput(
                        controller: nameCtrl,
                        hintText: 'Họ và tên',
                        labelText: 'Họ và tên',
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Vui lòng nhập họ và tên';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),

                      // Số CCCD
                      TextInput(
                        controller: cccdCtrl,
                        hintText: 'Số CCCD',
                        labelText: 'Số CCCD',
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Vui lòng nhập số CCCD';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      //Ngày cấp
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ngày cấp",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFonts.fontSize14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: issuedDateCtrl,
                            readOnly: true,
                            onTap: () => _pickDate(issuedDateCtrl),
                            decoration: _inputDecoration('Ngày cấp'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Email
                      TextInput(
                        controller: emailCtrl,
                        hintText: 'Email',
                        labelText: 'Email',
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Vui lòng nhập email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),

                      // Số điện thoại
                      TextInput(
                        controller: phoneCtrl,
                        hintText: 'Số điện thoại',
                        labelText: 'Số điện thoại',
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Vui lòng nhập số điện thoại';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),

                      // Địa chỉ
                      TextInput(
                        controller: addressCtrl,
                        hintText: 'Địa chỉ',
                        labelText: 'Địa chỉ',
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Vui lòng nhập địa chỉ';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),

                      // Ngày sinh
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ngày sinh",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFonts.fontSize14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: dobCtrl,
                            readOnly: true,
                            onTap: () => _pickDate(dobCtrl),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Ngày vào làm
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ngày vào làm",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFonts.fontSize14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: startDateCtrl,
                            readOnly: true,
                            onTap: () => _pickDate(startDateCtrl),
                            decoration: _inputDecoration('Ngày vào làm'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      // Tiếp theo button
                      SizedBox(
                        width: double.infinity,
                        child: BkButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              "create_staff_account_part2_screen",
                            );
                          },
                          title: 'Tiếp Theo',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
