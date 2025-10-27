import 'package:booking_tour_flutter/app/app_navigator.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:flutter/material.dart';

class ScheduleAssignmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phân công công các lịch trình', style: AppFonts.textWhite),
        backgroundColor: AppColors.button,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFEFEDED),
      body: columnOfWidget(),
    );
  }

  // gom các widget lại
  Widget columnOfWidget() {
    return Column(
      children: <Widget>[
        SizedBox(height: 12),
        tourCard(),
        SizedBox(height: 10),
        itemSchedule(),
      ],
    );
  }

  // item schedule
  Widget itemSchedule() {
    var context = AppNavigator.navigatorKey.currentContext!;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell (
        onTap: () {
          Navigator.pushNamed(context, RouteName.tourGuideAssignment);
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                // Mã nhân viên
                Row(
                  children: [
                    const Icon(Icons.code, size: 30, color: Colors.black),
            
                    const SizedBox(width: 14),
            
                    Text(
                      "Mã BBGS",
                      style: AppFonts.text20.copyWith(fontWeight: FontWeight.bold),
                    ),
        
                    const SizedBox(width: 20),
        
                    Icon(Icons.check_circle_outline, size: 30, color: Colors.green,),
                  ],
                ),
            
                SizedBox(height: 20),
            
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 30,
                      color: Color(0xFFEA4335),
                    ),
            
                    const SizedBox(width: 14),
            
                    Text(
                      "Ngày bắt đầu: 20/10/2023",
                      style: AppFonts.text20.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
            
                SizedBox(height: 20),
            
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 30,
                      color: Color(0xFFEA4335),
                    ),
            
                    const SizedBox(width: 14),
            
                    Text(
                      "Ngày kết thúc: 20/10/2023",
                      style: AppFonts.text20.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Quản lý tour
  Widget tourCard() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Ảnh
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Thêm dòng này
            child: Image.network(
              "https://lh3.googleusercontent.com/a/ACg8ocJm9cIxvh1X-PHJVIaKPA6LrC5aeChHzskzPlvne6ggWnnY3Fg",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          // Content
          SizedBox(height: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chuyến đi phú quốc",
                style: AppFonts.text20.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Icon(Icons.location_on, size: 22),
                  SizedBox(width: 10),
                  Text(
                    "Hạ Long",
                    style: AppFonts.text20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Text(
                    "100000",
                    style: AppFonts.text20.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6779E3),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "VNĐ",
                    style: AppFonts.text20.copyWith(
                      fontWeight: FontWeight.bold,
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
