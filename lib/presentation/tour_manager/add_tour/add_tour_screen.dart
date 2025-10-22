import 'dart:io';

import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/widgets/image_buttons.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/widgets/image_list.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/widgets/nullable_image.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/pick_image_button/pick_image_button_cubit.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/pick_image_button/pick_image_button_state.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTourScreen extends StatelessWidget {
  var pickImageCubit = PickImageButtonCubit(allowMultiple: true, maxImages: 5);
  final TextEditingController _tourNameController = TextEditingController();
  AddTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text("Thêm chuyến đi")),
          SliverToBoxAdapter(child: NullableImage()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ImageButtons(
                pickImageCubit: pickImageCubit,
                onDeleteAllPressed: () {
                  pickImageCubit.clearAllImages();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<PickImageButtonCubit, PickImageButtonState>(
              bloc: pickImageCubit,
              builder: (context, state) {
                var files = state.files.map((i) => File(i.path)).toList();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ImageList(
                    onImageDelete: (i) => pickImageCubit.removeImage(i),
                    images: files,
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: BkTextfield(
              controller: _tourNameController,
              title: "Tên chuyến đi",
              hint: "Nhập tên chuyến đi",
            ),
          ),
        ],
      ),
    );
  }
}
