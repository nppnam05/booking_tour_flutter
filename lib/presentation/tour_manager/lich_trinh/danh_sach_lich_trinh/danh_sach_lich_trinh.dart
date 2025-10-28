import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/lich_trinh/schedule_demo.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/delete_button_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/drawer_bar/drawer_bar.dart';
import 'package:flutter/material.dart';

class DanhSachLichTrinhScreen extends StatelessWidget {
  const DanhSachLichTrinhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Schedule> schedules = [
      Schedule(
        id: 2,
        tourId: 1,
        imageUrl:
            "http://tt1220-001-site1.ntempurl.com/images/682ec9b9-57a0-4b87-809a-773b53860ead.jpg",
        location: "Đà Lạt",
        description: "Tour Đà Lạt 3 ngày 2 đêm",
        startDate: "28/10/2025",
        endDate: "28/10/2025",
        maxCapacity: 1000,
        finalPrice: 100000000,
        openDateIso: "2025-10-28T07:15:30.941",
        startDateIso: "2025-10-28T07:15:30.941",
        endDateIso: "2025-10-28T07:15:30.941",
        gatheringTime: "08:00:00",
        code: "string",
        desposit: 100,
        tourTitle: "Tour Đà Lạt 4 ngày 2 đêm",
        tourImages: [
          "http://tt1220-001-site1.ntempurl.com/images/682ec9b9-57a0-4b87-809a-773b53860ead.jpg",
          "http://tt1220-001-site1.ntempurl.com/images/d66e0d97-03fd-4568-ac72-b8124d3c785b.jpg",
        ],
        tourLocations: ["Đà Lạt"],
      ),
      Schedule(
        id: 9,
        tourId: 1,
        imageUrl:
            "http://tt1220-001-site1.ntempurl.com/images/d66e0d97-03fd-4568-ac72-b8124d3c785b.jpg",
        location: "Đà Lạt",
        description: "Tour Đà Lạt 3 ngày 2 đêm",
        startDate: "28/10/2025",
        endDate: "28/10/2025",
        maxCapacity: 1000,
        finalPrice: 100000000,
        openDateIso: "2025-10-28T06:13:31.219",
        startDateIso: "2025-10-28T06:13:31.219",
        endDateIso: "2025-10-28T06:13:31.219",
        gatheringTime: "09:06:00",
        code: "string",
        desposit: 100,
        tourTitle: "Tour Đà Lạt 3 ngày 2 đêm",
        tourImages: [
          "http://tt1220-001-site1.ntempurl.com/images/682ec9b9-57a0-4b87-809a-773b53860ead.jpg",
          "http://tt1220-001-site1.ntempurl.com/images/d66e0d97-03fd-4568-ac72-b8124d3c785b.jpg",
        ],
        tourLocations: ["Đà Lạt"],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lịch Trình",
          style: AppFonts.textWhite.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.button,
        centerTitle: true,
      ),
      drawer: const DrawerBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: schedules.length,
                itemBuilder: (context, index) {
                  final tour = schedules[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ScheduleListItem(
                      schedule: tour,
                      onDelete: () {
                        print("hello");
                      },
                    ),
                  );
                },
              ),
            ),
          ),

          // Nút thêm tại dùng lại layout của nút xoá
          DeleteButtonWidget(
            onDelete: () {
              // Build unique list of tour options (id + title) from schedules
              final Map<int, String> idToTitle = {};
              for (final s in schedules) {
                if (s.tourId != null && (s.tourTitle ?? '').isNotEmpty) {
                  idToTitle[s.tourId!] = s.tourTitle!;
                }
              }
              final options =
                  idToTitle.entries
                      .map((e) => TourOption(id: e.key, title: e.value))
                      .toList();

              Navigator.pushNamed(
                context,
                RouteName.themLichTrinh,
                arguments: options,
              );
            },
            text: "+ Thêm",
            textColor: Colors.white,
            backgroundColor: AppColors.button,
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class ScheduleListItem extends StatelessWidget {
  final Schedule schedule;
  final VoidCallback onDelete;

  const ScheduleListItem({
    super.key,
    required this.schedule,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteName.chiTietLichTrinh,
            arguments: schedule,
          );
        },
        child: Card(
          color: const Color(0xFFE5F7F4),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildImage(),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildDate(),

                        const SizedBox(width: 6),

                        _buildIconText(
                          Icons.location_on,
                          AppColors.error,
                          schedule.location,
                        ),
                        const SizedBox(height: 4),

                        _buildIconText(
                          Icons.park,
                          AppColors.button,
                          schedule.description,
                        ),
                        const SizedBox(height: 4),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildIconText(
                              Icons.group,
                              AppColors.borderButton,
                              "Tối đa: ${schedule.maxCapacity}",
                            ),
                            DeleteButtonWidget(
                              onDelete: onDelete,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDate() {
    return Row(
      children: [
        const Icon(Icons.calendar_month, size: 18, color: AppColors.button),
        const SizedBox(width: 4),

        Text(
          schedule.startDate,
          style: AppFonts.text14.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),

        const Icon(Icons.arrow_right_alt, size: 28, color: AppColors.info),
        const SizedBox(width: 8),

        Text(
          schedule.endDate,
          style: AppFonts.text14.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRect(
      child: Image.network(
        schedule.imageUrl.isNotEmpty
            ? schedule.imageUrl
            : 'https://via.placeholder.com/100x120.png?text=No+Image',
        width: 100,
        height: 120,
        fit: BoxFit.cover,
        errorBuilder:
            (context, error, stackTrace) => Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.backgroundDisable,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.broken_image,
                size: 40,
                color: AppColors.gray,
              ),
            ),
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    var tmp = text.split(" ");
    var limitedWords = tmp.length > 5 ? tmp.sublist(0, 5) : tmp;
    var str = limitedWords.join(" ");
    if (tmp.length > 5) str += " ...";

    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 4),
        Text(str, style: AppFonts.text16),
      ],
    );
  }
}
