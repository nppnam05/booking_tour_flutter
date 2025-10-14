import 'package:image_picker/image_picker.dart';

class PickImageButtonState {
  final bool picking;
  final XFile? file;
  final String? error;

  const PickImageButtonState({this.picking = false, this.file, this.error});

  PickImageButtonState copyWith({
    bool? picking,
    XFile? file,
    String? error,
    bool clearFile = false,
  }) {
    return PickImageButtonState(
      picking: picking ?? this.picking,
      file: clearFile ? null : (file ?? this.file),
      error: error,
    );
  }
}
