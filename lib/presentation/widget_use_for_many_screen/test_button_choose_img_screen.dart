import 'dart:io';

import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/delete_button_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/spiner_widget/dropdown_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/pick_image_button/pick_image_button.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/spiner_widget/select_dialog/select_dialog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  XFile? selectedImage;
  List<String> selectedProvinces = [];
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedImage != null)
              Image.file(File(selectedImage!.path), height: 200),
            SizedBox(height: 20),
            PickImageButton(
              text: 'Chọn Ảnh',
              onImagePicked: (image) {
                if (image != null) {
                  setState(() => selectedImage = image);
                }
              },
            ),
            SizedBox(height: 20),
            DeleteButtonWidget(
              onDelete: () {
                //TODO: truyền 1 cái callback vào để xóa gì đó
              },
            ),

            SearchBarWidget(
              controller: _controller,
              onChanged: (value) {
                // TODO: Xử lý khi giá trị trong ô tìm kiếm thay đổi
              },
              onClear: () {
                _controller.clear();
              },
            ),

            DropDownWidget(
              title: 'Hoạt động',
              options: [
                'Quảng Ninh',
                'Hồ Chí Minh',
                'Vũng Tàu',
                'Hà Nội',
                'Huế',
                "Đà Nẵng",
                'Bình Dương',
                'Cần Thơ',
              ],
              onChanged: (values) {
                debugPrint('Đã chọn: $values');
              },
            ),
            DropDownWidget(
              title: 'Tỉnh Thành',
              options: const [
                'Quảng Ninh',
                'Hồ Chí Minh',
                'Vũng Tàu',
                'Hà Nội',
                'Huế',
                'Đà Nẵng',
                'Bình Dương',
              ],
              mode: SelectMode.multiple,
              onChanged: (values) {
                setState(() => selectedProvinces = values);
              },
            ),
          ],
        ),
      ),
    );
  }
}
