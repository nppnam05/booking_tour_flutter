import 'dart:io';

import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/widgets/nullable_image.dart';
import 'package:flutter/widgets.dart';

class ImageList extends StatelessWidget {
  final List<File> images;
  final Function(int i) onImageDelete;

  const ImageList({
    super.key,
    required this.images,
    required this.onImageDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Quản lý chuyến đi"),
        Visibility(visible: images.isNotEmpty, child: SizedBox(height: 10)),
        Visibility(
          visible: images.isNotEmpty,
          child: SizedBox(
            height: 90,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Image.file(
                        images[i],
                        fit: BoxFit.fill,
                        width: 100,
                        height: 80,
                        errorBuilder: (context, error, stackTrace) {
                          return NullableImage();
                        },
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: () => onImageDelete(i),
                          behavior: HitTestBehavior.translucent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/close.png",
                              width: 10,
                              height: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: images.length,
            ),
          ),
        ),
      ],
    );
  }
}
