import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/widgets/custom_button.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_toggle_input_field_ic.dart';
import 'package:booking_tour_flutter/presentation/widgets/payment_option.dart';
import 'package:flutter/material.dart';

class BookScheduleScreen extends StatelessWidget {
  BookScheduleScreen({super.key});

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSoDienThoai = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Du lịch vũng tàu")),
      body: SingleChildScrollView(child: Center(child: columnOfWidget())),
    );
  }

  // gom các widget lại
  Widget columnOfWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),

        scheduleInfoCard(),

        SizedBox(height: 20),

        Form(
          key: _formKey,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                notToggleInputFieldNotIcon(
                  controller: controllerEmail,
                  title: "Số lượng người tham gia",
                  color: Colors.grey.shade100,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'bạn chưa viết gì vào ô này';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                notToggleInputFieldNotIcon(
                  controller: controllerEmail,
                  title: "Email",
                  color: Colors.grey.shade100,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'bạn chưa viết gì vào ô này';
                    } else if (!isEmailValid(value)) {
                      return "Email này chưa đúng định dạng";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                notToggleInputFieldNotIcon(
                  controller: controllerSoDienThoai,
                  title: "Số điện thoại",
                  color: Colors.grey.shade100,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'bạn chưa viết gì vào ô này';
                    } else if (value.length < 10) {
                      return "độ dài số điện thoại thiếu";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [Text("Hình thức thanh toán", style: AppFonts.text20)],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PaymentRadioGroup(onChanged: (value) {}),
        ),

        SizedBox(height: 12,),

        Container(
          width: double.infinity,
          color: Color(0xFFF6FDFF),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tổng số tiền: ", style: AppFonts.text14.copyWith(fontWeight: FontWeight.bold)),
                Text("1.500.000 VNĐ", style: AppFonts.text14.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),

        SizedBox(height: 12,),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: customButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            text: "Thanh toán ngay",
          ),
        ),
      ],
    );
  }

  Widget scheduleInfoCard() {
    return Container(
      width: double.infinity,
      color: AppColors.button,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("🌴", style: TextStyle(fontSize: 30)),
              SizedBox(width: 30),
              Text(
                "Chuyến đi phú quốc ",
                style: AppFonts.text28.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Số lượng khách
          Row(
            children: [
              const SizedBox(width: 10),
              const Icon(Icons.people, size: 30, color: Colors.red),
              const SizedBox(width: 20),
              Text(
                "số lượng tham gia: ",
                style: AppFonts.text16.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 30),
              Text(
                "25 người",
                style: AppFonts.text16.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              const SizedBox(width: 10),
              const Icon(Icons.calendar_today, size: 30, color: Colors.red),

              const SizedBox(width: 20),

              Text(
                "15/10/2024 - 17/10/2024",
                style: AppFonts.text16.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Địa điểm
          Row(
            children: [
              const SizedBox(width: 10),
              const Icon(Icons.location_on, size: 30, color: Colors.red),
              const SizedBox(width: 20),
              Text(
                "Khởi hành từ thành phố HCM",
                style: AppFonts.text16.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    return emailRegex.hasMatch(email);
  }
}
