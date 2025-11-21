import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'create_staff_account_part2_state.dart';

class CreateStaffAccountPart2Cubit extends Cubit<CreateStaffAccountPart2State> {
  final ImagePicker _picker = ImagePicker();

  CreateStaffAccountPart2Cubit() : super(const CreateStaffAccountPart2State());

  Future<void> pickImage(ImageSource source, {required bool isFront}) async {
    try {
      final picked = await _picker.pickImage(source: source, imageQuality: 85);
      if (picked != null) {
        if (isFront) {
          emit(state.copyWith(frontPath: picked.path));
        } else {
          emit(state.copyWith(backPath: picked.path));
        }
      }
    } catch (_) {}
  }

  void removeImage({required bool isFront}) {
    if (isFront) {
      emit(state.copyWith(frontPath: null));
    } else {
      emit(state.copyWith(backPath: null));
    }
  }

  Future<Map<String, String?>> confirm() async {
    emit(state.copyWith(submitting: true));
    await Future<void>.delayed(const Duration(milliseconds: 300));
    emit(state.copyWith(submitting: false));
    return {'front': state.frontPath, 'back': state.backPath};
  }
}
