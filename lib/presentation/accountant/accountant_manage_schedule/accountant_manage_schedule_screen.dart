import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:flutter/material.dart';

class AccountantManageScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quản lý lịch trình",
          style: AppFonts.text24.copyWith(color: AppColors.white),
        ),
      ),
      body: columnOfWidget(),
    );
  }

  // gom các widget lại
  Widget columnOfWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [SliverToBoxAdapter(child: scheduleCard())],
      ),
    );
  }

  // quản lý Schedule
  Widget scheduleCard() {
    return scheduleInfoCard();
  }

  Widget scheduleInfoCard() {
    // var startDate = schedule.startDate;
    // var endDate = schedule.endDate;

    // final locationNames = schedule.tour.locations
    //     .map((loc) => loc.name)
    //     .join(', ');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          // Mã lịch trình
          Row(
            children: [
              Text(
                "#{schedule.code}",
                style: AppFonts.text20.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Ngày tháng
          Column(
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/destination_place.png'),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Lịch trình 3N2Đ",
                          style: AppFonts.text24.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 20, color: Colors.red),
                  const SizedBox(width: 30),
                  Text(
                    "15 - 17/10/2024",
                    style: AppFonts.text16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Số lượng khách
                  const Icon(Icons.people, size: 20, color: Colors.orange),
                  const SizedBox(width: 30),
                  Text(
                    "20-25 người",
                    style: AppFonts.text16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Địa điểm
              Row(
                children: [
                  const Icon(Icons.location_on, size: 20, color: Colors.red),
                  const SizedBox(width: 30),
                  Text(
                    "locationNames",
                    style: AppFonts.text16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // tour title
              Row(
                children: [
                  const Icon(Icons.tour, size: 20, color: Color(0xFF1B5621)),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Text(
                      "schedule.tour.title",
                      style: AppFonts.text16.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
