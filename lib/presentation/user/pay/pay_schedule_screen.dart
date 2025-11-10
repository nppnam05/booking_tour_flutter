import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PayScheduleScreen extends StatelessWidget {
  PayScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Du lịch Vũng Tàu")),
      body: SingleChildScrollView(child: Center(child: columnOfWidget())),
    );
  }

  Widget columnOfWidget() {
    return Column(
      children: [
        SizedBox(height: 20),
        scheduleInfoCard(),
        SizedBox(height: 15),
        inforUserCard(),
        SizedBox(height: 15,),
        qrCode()
      ],
    );
  }

  Widget qrCode(){
    return Column(
      children: [
        Text("Quét mã tại đây để thanh toán", style: AppFonts.text18,),
        SizedBox(height: 12,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: customButton(onPressed: (){
          
          }, text: "Tải Mã QR"),
        )
      ],
    );
  }

  Widget inforUserCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Thông tin của bạn", style: AppFonts.text20),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Loại thanh toán", style: AppFonts.text18),
                    Text(
                      "Toàn bộ",
                      style: AppFonts.text18.copyWith(color: Color(0xFF00FF88)),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng số tiền", style: AppFonts.text18),
                    Text(
                      "1.000.000 VNĐ",
                      style: AppFonts.text18,
                    ),
                  ],
                ),
                 SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email", style: AppFonts.text18),
                    Text(
                      "myEmail@gmail.com",
                      style: AppFonts.text18,
                    ),
                  ],
                ),
                 SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Số điện thoại", style: AppFonts.text18),
                    Text(
                      "0123456789",
                      style: AppFonts.text18,
                    ),
                  ],
                ),
                 SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng số người", style: AppFonts.text18),
                    Text(
                      "10 Người",
                      style: AppFonts.text18,
                    ),
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Text("Lưu ý:", style: AppFonts.text18.copyWith(color: Colors.red),),
                  ],
                ),
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Nếu sau 2 tiếng bạn chưa thanh toán thì chuyến đi của bạn sẽ bị hủy", style: AppFonts.text18,),
                )
              ],
            ),
          ),
        ],
      ),
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
}
