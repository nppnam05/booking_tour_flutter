import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/datepicker_and_time/date_picker.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/datepicker_and_time/time_picker/time_picker.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/drawer_bar/drawer_bar.dart';
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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF23A892),
        centerTitle: true,
      ),
      drawer: DrawerBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: _buildTextField(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ElevatedButton(
              onPressed: () {
                print("hele");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF23A892),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
              ),
              child: const Text( style: TextStyle(color: Colors.white)  ,"Lưu"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Column(
      children: [
        notIconToggleInputField(_controllerTour, "Tour", Colors.grey.shade100),

        // Ngày mở and bắt đầu
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  "Ngày mở đăng kí",
                ),
                DatePickerFieldWidget(
                  onDateSelected: (date) {
                    print("Ngày được chọn: $date");
                  },
                  primaryColor: Colors.grey.shade100,
                ),
              ],
            ),

            SizedBox(width: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  "Ngày bắt đầu",
                ),
                DatePickerFieldWidget(
                  onDateSelected: (date) {
                    print("Ngày được chọn: $date");
                  },
                  primaryColor: Colors.grey.shade100,
                ),
              ],
            ),
          ],
        ),

        notIconToggleInputField(
          _controllerNguoiToiDa,
          "Người tối đa",
          Colors.grey.shade100,
        ),
        notIconToggleInputField(_controllerGia, "Giá", Colors.grey.shade100),
        notIconToggleInputField(
          _controllerTour,
          "Số tiền cọc",
          Colors.grey.shade100,
        ),

        //Thời gian tập hợp
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  "Thời gian tập hợp",
                ),
                TimePickerFieldWidget(
                  onDateSelected: (time) {
                    print("holo");
                  },
                  primaryColor: Colors.grey.shade100,
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
                  primaryColor: Colors.grey.shade100,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
