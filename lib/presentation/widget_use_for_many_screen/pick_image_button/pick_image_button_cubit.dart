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

  Future<void> pickImage() async {
    emit(state.copyWith(picking: true, error: null));

    if (state.allowMultiple) {
      final int limit = state.maxImages - state.files.length;
      final int pickLimit = limit > 0 ? limit : state.maxImages;
      final List<XFile> images = await _picker.pickMultiImage(limit: pickLimit);
      if (images.isNotEmpty) {
        final List<XFile> imagesToAdd = images.take(pickLimit).toList();

        final List<XFile> newFiles =
            limit > 0 ? <XFile>[...state.files, ...imagesToAdd] : imagesToAdd;
        emit(state.copyWith(picking: false, files: newFiles, error: null));
      } else {
        emit(state.copyWith(picking: false));
      }
    } else {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      emit(
        state.copyWith(
          picking: false,
          files: image != null ? [image] : [],
          error: null,
        ),
      );
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
