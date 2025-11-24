import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'create_staff_account_part1_state.dart';

class CreateStaffAccountPart1Cubit
    extends Cubit<CreateStaffAccountPart1State> {
  final ImagePicker _picker = ImagePicker();

  CreateStaffAccountPart1Cubit() : super(const CreateStaffAccountPart1State());

  Future<void> pickAvatar(ImageSource source) async {
    try {
      final picked = await _picker.pickImage(source: source, imageQuality: 85);
      if (picked != null) {
        emit(state.copyWith(avatarPath: picked.path));
      }
    } catch (_) {}
  }

  void removeAvatar() {
    emit(state.copyWith(avatarPath: null));
  }

  void setRole(int roleId, String roleTitle) {
    emit(state.copyWith(roleId: roleId, selectedRole: roleTitle));
  }

  void saveData({
    required String account,
    required String password,
    required String name,
    required String cccd,
    String? issuedDate,
    required String email,
    required String phone,
    required String address,
    String? dob,
    String? startDate,
    required String selectedRole,
    int? roleId,
  }) {
    emit(
      state.copyWith(
        account: account,
        password: password,
        name: name,
        cccd: cccd,
        issuedDate: issuedDate,
        email: email,
        phone: phone,
        address: address,
        dob: dob,
        startDate: startDate,
        selectedRole: selectedRole,
        roleId: roleId,
      ),
    );
  }
}

