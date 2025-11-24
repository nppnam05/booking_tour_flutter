import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:flutter/material.dart';

class AccountantManageScheduleScreen extends StatelessWidget {
  final List<String> tabTitles = ['Chưa thanh toán', 'Đã cọc', 'Đã thanh toán'];
  final int tabCount = 3;

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
      child: DefaultTabController( 
        length: tabCount,
        child: Column( 
          children: [
           
            scheduleInfoCard(),

            const SizedBox(height: 10),

            
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TabBar(
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.button,
                ),
                labelStyle: AppFonts.text16.copyWith(fontWeight: FontWeight.bold),
                unselectedLabelStyle: AppFonts.text16,
                labelColor: AppColors.white,
                unselectedLabelColor: Colors.grey[700],
                tabs: tabTitles.map((title) => Tab(text: title)).toList(),
              ),
            ),

            const SizedBox(height: 10),

            
            Expanded( 
              child: TabBarView(
                children: [
                  TourList(status: 'Chưa thanh toán'),
                  TourList(status: 'Đã cọc'),
                  TourList(status: 'Đã thanh toán'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

              const SizedBox(height: 20),

              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 30, color: Colors.red),
                  const SizedBox(width: 15),
                  Text(
                    "15 - 17/10/2024",
                    style: AppFonts.text16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(width: 50),

                  // Số lượng khách
                  const Icon(Icons.people, size: 30, color: Colors.orange),
                  const SizedBox(width: 15),
                  Text(
                    "20-25 người",
                    style: AppFonts.text16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Địa điểm
              Row(
                children: [
                  const Icon(Icons.location_on, size: 30, color: Colors.red),
                  const SizedBox(width: 15),
                  Text(
                    "locationNames",
                    style: AppFonts.text16.copyWith(
                      fontWeight: FontWeight.w600,
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

class TourList extends StatelessWidget {
    final String status;
    TourList({required this.status});
    
    @override
    Widget build(BuildContext context) {
        // Đây là nơi bạn lọc dữ liệu và hiển thị ListView.builder
        return Center(child: Text('Danh sách: $status')); 
    }
}
