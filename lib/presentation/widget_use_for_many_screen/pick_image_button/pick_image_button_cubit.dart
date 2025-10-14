import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'pick_image_button_state.dart';

class PickImageButtonCubit extends Cubit<PickImageButtonState> {
  final ImagePicker _picker = ImagePicker();

  PickImageButtonCubit() : super(const PickImageButtonState());

  Future<void> pickImage(ImageSource source) async {
    emit(state.copyWith(picking: true, error: null));
    try {
      final XFile? image = await _picker.pickImage(source: source);
      emit(state.copyWith(picking: false, file: image, error: null));
    } catch (e) {
      emit(state.copyWith(picking: false, error: 'Lỗi chọn ảnh'));
    }
  }
}
