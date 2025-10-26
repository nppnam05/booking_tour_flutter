import 'dart:io';

import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/widgets/nullable_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class BkImage extends StatelessWidget {
  final Either<File, String> image;

  const BkImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return image.fold(
      (file) {
        return Image.file(
          file,
          fit: BoxFit.fill,
          width: 100,
          height: 80,
          errorBuilder: (context, error, stackTrace) {
            return NullableImage();
          },
        );
      },
      (url) {
        return Image.network(
          url,
          fit: BoxFit.fill,
          width: 100,
          height: 80,
          errorBuilder: (context, error, stackTrace) {
            return NullableImage();
          },
        );
      },
    );
  }
}