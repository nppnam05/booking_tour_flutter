import 'package:booking_tour_flutter/app/dependency_injection/format_date_number.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/domain/role.dart';
import 'package:booking_tour_flutter/domain/staff.dart';
import 'package:booking_tour_flutter/domain/user.dart';
import 'package:booking_tour_flutter/presentation/admin/account_management/cubit/account_management_cubit.dart';
import 'package:booking_tour_flutter/presentation/admin/account_management/cubit/account_management_state.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateStaffAccountScreen extends StatefulWidget {
  const UpdateStaffAccountScreen({super.key});

  @override
  State<UpdateStaffAccountScreen> createState() =>
      _UpdateStaffAccountScreenState();
}

class _UpdateStaffAccountScreenState extends State<UpdateStaffAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _idController;
  late final TextEditingController _nameController;
  late final TextEditingController _cccdController;
  late final TextEditingController _idIssueDateController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _dobController;
  late final TextEditingController _joinDateController;
  late final TextEditingController _leaveDateController;

  String? _roleValue;
  bool _isActive = true;
  Staff? _staff;

  @override
  void initState() {
    super.initState();
    final state = context.read<AccountManagementCubit>().state;
    _staff = state.selectedStaff;
    _isActive = _staff?.isActive ?? true;
    _roleValue = _staff?.role.title;

    _idController = TextEditingController(
      text: _staff?.user.id.toString() ?? '',
    );
    _nameController = TextEditingController(text: _staff?.user.name ?? '');
    _cccdController = TextEditingController(text: _staff?.cccd ?? '');
    _idIssueDateController = TextEditingController(
      text: _staff == null ? '' : formatDate(_staff!.cccdIssueDate),
    );
    _emailController = TextEditingController(text: _staff?.user.email ?? '');
    _phoneController = TextEditingController(text: _staff?.user.phone ?? '');
    _addressController = TextEditingController(text: _staff?.address ?? '');
    _dobController = TextEditingController(
      text: _staff == null ? '' : formatDate(_staff!.dateOfBirth),
    );
    _joinDateController = TextEditingController(
      text: _staff == null ? '' : formatDate(_staff!.startWorkingDate),
    );
    _leaveDateController = TextEditingController(
      text: _staff == null ? '' : formatDate(_staff!.endWorkingDate),
    );

    if (_staff == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Không có dữ liệu nhân viên')),
        );
        Navigator.of(context).pop();
      });
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _cccdController.dispose();
    _idIssueDateController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _joinDateController.dispose();
    _leaveDateController.dispose();
    super.dispose();
  }

  DateTime _parseDate(String value, DateTime fallback) {
    try {
      final parts = value.split('/');
      if (parts.length == 3) {
        final day = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final year = int.parse(parts[2]);
        return DateTime(year, month, day);
      }
    } catch (_) {}
    return fallback;
  }

  Future<void> _pickDate(
    TextEditingController controller,
    DateTime fallback,
  ) async {
    final initial = _parseDate(controller.text, fallback);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = formatDate(picked);
    }
  }

  void _save() {
    if (_staff == null) return;
    if (!_formKey.currentState!.validate()) return;

    final current = _staff!;
    final updatedUser = User(
      id: current.user.id,
      roleId: current.user.roleId,
      money: current.user.money,
      bankNumber: current.user.bankNumber,
      bank: current.user.bank,
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      avatarPath: current.user.avatarPath,
      bankBranch: current.user.bankBranch,
      refundStatus: current.user.refundStatus,
    );

    final updatedRole = Role(
      id: current.role.id,
      title: _roleValue ?? current.role.title,
    );

    final updatedStaff = Staff(
      userId: current.userId,
      code: current.code,
      isActive: _isActive,
      cccd: _cccdController.text.trim(),
      address: _addressController.text.trim(),
      dateOfBirth: _parseDate(_dobController.text, current.dateOfBirth),
      startWorkingDate: _parseDate(
        _joinDateController.text,
        current.startWorkingDate,
      ),
      cccdIssueDate: _parseDate(
        _idIssueDateController.text,
        current.cccdIssueDate,
      ),
      cccD_front_path: current.cccD_front_path,
      cccD_back_path: current.cccD_back_path,
      endWorkingDate: _parseDate(
        _leaveDateController.text,
        current.endWorkingDate,
      ),
      user: updatedUser,
      role: updatedRole,
    );

    context.read<AccountManagementCubit>().setSelectedStaff(updatedStaff);
    setState(() => _staff = updatedStaff);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Cập nhật thành công')));
    Navigator.of(context).pop();
  }

  Widget _buildDateField(
    String label,
    TextEditingController controller,
    DateTime fallback,
  ) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: () => _pickDate(controller, fallback),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      validator:
          (value) =>
              value == null || value.isEmpty ? 'Vui lòng chọn $label' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundAppBarTheme,
        title: const Text('Cập nhật nhân viên'),
        leading: BackButton(color: Colors.white),
      ),
      body:
          _staff == null
              ? const SizedBox.shrink()
              : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 34,
                              backgroundColor: AppColors.backgroundAppBarTheme,
                              child: Text(
                                _staff!.user.name.isNotEmpty
                                    ? _staff!.user.name[0].toUpperCase()
                                    : '?',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _staff!.user.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: _idController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'ID tài khoản',
                        ),
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<AccountManagementCubit, AccountManagementState>(
                        builder: (context, state) {
                          final filteredRoles = state.roles
                              .where((role) => role.title.toLowerCase() != 'user')
                              .toList();
                          final roleTitles = filteredRoles.map((role) => role.title).toList();
                          
                          return DropdownButtonFormField<String>(
                            value: _roleValue,
                            items: roleTitles
                                .map(
                                  (role) => DropdownMenuItem(
                                    value: role,
                                    child: Text(role),
                                  ),
                                )
                                .toList(),
                            onChanged:
                                (value) => setState(() => _roleValue = value),
                            decoration: const InputDecoration(labelText: 'Chức vụ'),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Đang hoạt động'),
                        value: _isActive,
                        onChanged: (value) => setState(() => _isActive = value),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Họ và tên',
                        ),
                        validator:
                            (value) =>
                                value == null || value.trim().isEmpty
                                    ? 'Vui lòng nhập họ và tên'
                                    : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator:
                            (value) =>
                                value == null || value.trim().isEmpty
                                    ? 'Vui lòng nhập email'
                                    : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Số điện thoại',
                        ),
                        keyboardType: TextInputType.phone,
                        validator:
                            (value) =>
                                value == null || value.trim().isEmpty
                                    ? 'Vui lòng nhập số điện thoại'
                                    : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _addressController,
                        decoration: const InputDecoration(labelText: 'Địa chỉ'),
                        validator:
                            (value) =>
                                value == null || value.trim().isEmpty
                                    ? 'Vui lòng nhập địa chỉ'
                                    : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _cccdController,
                        decoration: const InputDecoration(
                          labelText: 'CCCD/CMND',
                        ),
                        keyboardType: TextInputType.number,
                        validator:
                            (value) =>
                                value == null || value.trim().isEmpty
                                    ? 'Vui lòng nhập CCCD'
                                    : null,
                      ),
                      const SizedBox(height: 12),
                      _buildDateField(
                        'Ngày cấp CCCD',
                        _idIssueDateController,
                        _staff!.cccdIssueDate,
                      ),
                      const SizedBox(height: 12),
                      _buildDateField(
                        'Ngày sinh',
                        _dobController,
                        _staff!.dateOfBirth,
                      ),
                      const SizedBox(height: 12),
                      _buildDateField(
                        'Ngày vào làm',
                        _joinDateController,
                        _staff!.startWorkingDate,
                      ),
                      const SizedBox(height: 12),
                      _buildDateField(
                        'Ngày nghỉ việc',
                        _leaveDateController,
                        _staff!.endWorkingDate,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: BkButton(
                              title: 'HỦY',
                              backgroundColor: Colors.grey.shade300,
                              textColor: Colors.black87,
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: BkButton(
                              title: 'Cập nhật',
                              backgroundColor: AppColors.backgroundAppBarTheme,
                              onPressed: _save,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
    );
  }
}
