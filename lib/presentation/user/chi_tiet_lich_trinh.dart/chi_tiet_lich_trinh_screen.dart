import 'package:booking_tour_flutter/app/dependency_injection/format_date_number.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/domain/schedule_tourmanager.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChiTietLichTrinhScreen extends StatelessWidget {
  const ChiTietLichTrinhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final schedule =
        ModalRoute.of(context)!.settings.arguments as ScheduleTourmanager;
    final tour = schedule.tour;

    return Scaffold(
      appBar: AppBar(title: Text(tour.title), centerTitle: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              tour.tourImages.isNotEmpty ? tour.tourImages.first : '',
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Container(
              height: 90,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: tour.tourImages.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      tour.tourImages[index],
                      width: 120,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tour.title,
                    style: TextStyle(
                      fontSize: AppFonts.fontSize20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month_outlined, size: 20),
                        const SizedBox(width: 6),
                        Text(
                          "${formatDate(schedule.startDate)} - ${formatDate(schedule.endDate)}",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("${schedule.maxSlot} người"),
                  ),

                  const SizedBox(height: 8),

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "${NumberFormat("#,###", "vi_VN").format(tour.price)} VNĐ / người",
                      style: TextStyle(
                        color: AppColors.delete,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFonts.fontSize16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 20),
                        const SizedBox(width: 6),
                        Text(
                          tour.provinces.map((e) => e.name).join(", "),
                          style: TextStyle(fontSize: AppFonts.fontSize14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text(
                    "Các điểm đến",
                    style: TextStyle(
                      fontSize: AppFonts.fontSize20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...tour.places.map((place) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12, left: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, color: Colors.red, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              place.name,
                              style: TextStyle(fontSize: AppFonts.fontSize14),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Chi tiết lịch trình",
                          style: TextStyle(
                            fontSize: AppFonts.fontSize16,
                            color: AppColors.gray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.chevron_right,
                          color: AppColors.gray,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Mô tả",
                    style: TextStyle(
                      fontSize: AppFonts.fontSize20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(tour.description),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: BkButton(
                      onPressed: () {
                        // TODO: chuyển sang màn hình đặt ngay
                      },
                      title: "Đặt ngay",
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
