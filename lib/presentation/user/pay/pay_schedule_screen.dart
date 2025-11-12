import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/domain/pay_booking.dart';
import 'package:booking_tour_flutter/domain/schedule_book.dart';
import 'package:booking_tour_flutter/presentation/user/pay/cubit/pay_schedule_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/pay/cubit/pay_schedule_state.dart';
import 'package:booking_tour_flutter/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayScheduleScreen extends StatelessWidget {
  PayScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<PayScheduleCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Text("Thanh toán chuyến đi")),
        body: SingleChildScrollView(child: Center(child: columnOfWidget())),
      ),
    );
  }

  Widget columnOfWidget() {
    return Column(
      children: [
        SizedBox(height: 20),
        BlocBuilder<PayScheduleCubit, PayScheduleState>(
          builder: (context, state) {
            return scheduleInfoCard(state.schedule);
          },
        ),
        SizedBox(height: 15),
        BlocBuilder<PayScheduleCubit, PayScheduleState>(
          builder: (context, state) {
            return inforUserCard(state.paySchedule);
          },
        ),
        SizedBox(height: 15),
        BlocBuilder<PayScheduleCubit, PayScheduleState>(
          builder: (context, state) {
            return qrCode(state.linkQR);
          },
        ),
      ],
    );
  }

  Widget qrCode(String linkQR) {
    return Column(
      children: [
        SizedBox(height: 12),
        Image.network(
          linkQR,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Text('Không thể tải ảnh');
          },
        ),
        SizedBox(height: 12),
        Text("Quét mã tại đây để thanh toán", style: AppFonts.text18),
        SizedBox(height: 12),
      ],
    );
  }

  Widget inforUserCard(PayBooking pay) {
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
                      pay.payType ? "Toàn bộ" : "Đặt cọc",
                      style: AppFonts.text18.copyWith(
                        color: pay.payType ? Color(0xFF00FF88) : Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng số tiền", style: AppFonts.text18),
                    Text("${pay.totalPrice}", style: AppFonts.text18),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email", style: AppFonts.text18),
                    Text("${pay.email}", style: AppFonts.text18),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Số điện thoại", style: AppFonts.text18),
                    Text("${pay.phone}", style: AppFonts.text18),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng số người", style: AppFonts.text18),
                    Text("${pay.numPeople} Người", style: AppFonts.text18),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      "Lưu ý:",
                      style: AppFonts.text18.copyWith(color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Nếu sau 2 tiếng bạn chưa thanh toán thì chuyến đi của bạn sẽ bị hủy",
                    style: AppFonts.text18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget scheduleInfoCard(ScheduleBook schedule) {
    var startDate = schedule.startDate;
    var endDate = schedule.endDate;

    var locationName = schedule.tour.locations
        .map((loc) => loc.name)
        .toSet() // Loại bỏ trùng lặp
        .join(', ');

    return Container(
      width: double.infinity,
      color: AppColors.button,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                schedule.tour.title,
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
                "${schedule.maxSlot} người",
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
                "${startDate.day}/${startDate.month}/${startDate.year} - ${endDate.day}/${endDate.month}/${endDate.year}",
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
                "Địa điểm là ${locationName}",
                style: AppFonts.text16.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
