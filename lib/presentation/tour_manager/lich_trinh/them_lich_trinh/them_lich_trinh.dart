import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/datepicker_and_time/date_picker.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/datepicker_and_time/time_picker.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/delete_button_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/drawer_bar/drawer_bar.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/dropdown_widget.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_icon_toggle_input_field.dart';
import 'package:flutter/material.dart';

class ThemLichTrinhScreen extends StatelessWidget {
  ThemLichTrinhScreen({super.key});

  final TextEditingController _controllerTour = TextEditingController();
  final TextEditingController _controllerNguoiToiDa = TextEditingController();
  final TextEditingController _controllerGia = TextEditingController();
  final TextEditingController _controllerTienCoc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thêm lịch trình",
          style: AppFonts.textWhite.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.button,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: _buildTextField(),
            ),
          ),

          // Nút lưu dùng lại của delete
          DeleteButtonWidget(
            onDelete: () {
              Navigator.pushNamed(context, RouteName.danhSachLichTrinh);
            },
            text: "Lưu",
            textColor: Colors.white,
            backgroundColor: AppColors.button,
          ),

          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Column(
      children: [
        _buildTour(),

        // Ngày mở and bắt đầu
        _buildNgayMoVaBatDau(),

        notIconToggleInputField(
          _controllerNguoiToiDa,
          "Người tối đa",
          AppColors.gray,
        ),

        notIconToggleInputField(_controllerGia, "Giá", AppColors.gray),

        notIconToggleInputField(
          _controllerTienCoc,
          "Số tiền cọc",
          AppColors.gray,
        ),

        //Thời gian tập hợp
        _buildThoiGianTapHop(),
      ],
    );
  }

  Widget _buildTour() {
    final List<String> provinces = [
      "Hà Nội",
      "Đà Nẵng",
      "Hồ Chí Minh",
      "Đà Lạt",
    ];
    String? selectedProvince;

    return DropDownWidget(
      title: "Tour",
      options: provinces,
      itemToString: (item) => item,
      onChanged: (value) {
        selectedProvince = value;
      },
    );
  }

  Widget _buildNgayMoVaBatDau() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              style: AppFonts.text14.copyWith(fontWeight: FontWeight.bold),
              "Ngày mở đăng kí",
            ),
            DatePickerFieldWidget(
              onDateSelected: (date) {
                print("Ngày được chọn: $date");
              },
              primaryColor: AppColors.gray,
            ),
          ],
        ),

        SizedBox(width: 20),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              style: AppFonts.text14.copyWith(fontWeight: FontWeight.bold),
              "Ngày bắt đầu",
            ),
            DatePickerFieldWidget(
              onDateSelected: (date) {
                print("Ngày được chọn: $date");
              },
              primaryColor: AppColors.gray,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildThoiGianTapHop() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              style: AppFonts.text14.copyWith(fontWeight: FontWeight.bold),
              "Thời gian tập hợp",
            ),
            TimePickerFieldWidget(
              onDateSelected: (time) {
                print("holo");
              },
              primaryColor: AppColors.gray,
            ),
          ],
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            DatePickerFieldWidget(
              onDateSelected: (date) {
                print("Ngày được chọn: $date");
              },
              primaryColor: AppColors.gray,
            ),
          ],
        ),
      ],
    );
  }
}
