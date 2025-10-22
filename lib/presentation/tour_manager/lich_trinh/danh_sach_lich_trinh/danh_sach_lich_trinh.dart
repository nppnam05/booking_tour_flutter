import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/lich_trinh/schedule_demo.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/datepicker_and_time/date_picker.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/datepicker_and_time/time_picker.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/delete_button_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/drawer_bar/drawer_bar.dart';
import 'package:flutter/material.dart';

class DanhSachLichTrinhScreen extends StatelessWidget {
  const DanhSachLichTrinhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Schedule> schedules = [
      Schedule(
        imageUrl: "",
        location: "Đà Lạt",
        description: "Khám phá rừng thông và hồ Xuân Hương",
        startDate: "01/11/2025",
        endDate: "03/11/2025",
        maxCapacity: 25,
      ),
      Schedule(
        imageUrl: "",
        location: "Phú Quốc",
        description: "Tham quan đảo và thưởng thức hải sản",
        startDate: "05/12/2025",
        endDate: "09/12/2025",
        maxCapacity: 40,
      ),
      Schedule(
        imageUrl: "",
        location: "Hạ Long",
        description: "Du thuyền và thăm hang Sửng Sốt",
        startDate: "10/01/2026",
        endDate: "12/01/2026",
        maxCapacity: 30,
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
          DeleteButtonWidget(onDelete: (){
            Navigator.pushNamed(context, RouteName.themLichTrinh);
          }, text: "+ Thêm", textColor: Colors.white, backgroundColor: AppColors.button,),
          SizedBox(height: 50,)
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
                            DeleteButtonWidget(onDelete: onDelete, textColor: Colors.white,),
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

        const Icon(
          Icons.arrow_right_alt,
          size: 28,
          color: AppColors.info
        ),
        const SizedBox(width: 8),

        Text(schedule.endDate, style: AppFonts.text14.copyWith(fontWeight: FontWeight.bold)),
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
