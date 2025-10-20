import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/dropdown_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/text_input.dart';
import 'package:flutter/material.dart';

class SuaDiaDiemHoatDongScreen extends StatefulWidget {
  const SuaDiaDiemHoatDongScreen({super.key});

  @override
  State<SuaDiaDiemHoatDongScreen> createState() =>
      _SuaDiaDiemHoatDongScreenState();
}

class _SuaDiaDiemHoatDongScreenState extends State<SuaDiaDiemHoatDongScreen> {
  String? selectedProvince;
  final List<String> provinces = [
    'Hà Nội',
    'TP. Hồ Chí Minh',
    'Đà Nẵng',
    'Hải Phòng',
    'Cần Thơ',
    'An Giang',
    'Bà Rịa - Vũng Tàu',
    'Bắc Giang',
    'Bắc Kạn',
    'Bạc Liêu',
  ];

  TextEditingController tenDiaDiemController = TextEditingController();

  @override
  void dispose() {
    tenDiaDiemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            Navigator.pushNamed(context, 'danh_sach_hoat_dong');
          },
        ),
        title: const Text(
          'Sửa Danh Sách Hoạt Động',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.button,
        centerTitle: true,
      ),
      backgroundColor: AppColors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextInput(
                labelText: "Tên địa điểm hoạt động",
                hintText: "Nhập địa điểm hoạt động",
                controller: tenDiaDiemController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropDownWidget<String>(
                title: 'Tỉnh/Thành phố',
                options: provinces,
                itemToString: (province) => province,
                value: selectedProvince,
                onChanged: (province) {
                  setState(() {
                    selectedProvince = province;
                  });
                },
              ),
            ),

            Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  //TODO: Xử lý khi nhấn nút Lưu
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Lưu',
                  style: TextStyle(
                    fontSize: AppFonts.fontSize16,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
