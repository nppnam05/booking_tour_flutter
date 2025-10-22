// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class AddTourState {
  final List<File> images;
  AddTourState({required this.images});

  AddTourState copyWith({List<File>? images}) {
    return AddTourState(images: images ?? this.images);
  }
}
