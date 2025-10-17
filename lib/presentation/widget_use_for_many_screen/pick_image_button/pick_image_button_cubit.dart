import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'pick_image_button_state.dart';

class PickImageButtonCubit extends Cubit<PickImageButtonState> {
  final ImagePicker _picker = ImagePicker();

  PickImageButtonCubit({bool allowMultiple = false, int maxImages = 3})
    : super(
        PickImageButtonState(
          allowMultiple: allowMultiple,
          maxImages: maxImages,
        ),
      );

  Future<void> pickImage(ImageSource source) async {
    emit(state.copyWith(picking: true, error: null));
    try {
      if (state.allowMultiple) {
        final List<XFile> images = await _picker.pickMultiImage();
        if (images.isNotEmpty) {
          final remainingSlots = state.maxImages - state.files.length;
          if (remainingSlots > 0) {
            final imagesToAdd = images.take(remainingSlots).toList();
            final newFiles = [...state.files, ...imagesToAdd];
            emit(state.copyWith(picking: false, files: newFiles, error: null));
          } else {
            emit(
              state.copyWith(
                picking: false,
                error: 'Đã đạt giới hạn tối đa ${state.maxImages} ảnh',
              ),
            );
          }
        } else {
          emit(state.copyWith(picking: false));
        }
      } else {
        final XFile? image = await _picker.pickImage(source: source);
        emit(
          state.copyWith(
            picking: false,
            files: image != null ? [image] : [],
            error: null,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(picking: false, error: 'Lỗi chọn ảnh: $e'));
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < state.files.length) {
      final newFiles = List<XFile>.from(state.files);
      newFiles.removeAt(index);
      emit(state.copyWith(files: newFiles));
    }
  }

  void clearAllImages() {
    emit(state.copyWith(clearFiles: true));
  }
}
