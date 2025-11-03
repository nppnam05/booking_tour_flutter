import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dialog_helper.dart';
import 'package:booking_tour_flutter/presentation/profile/detail_paid_schedule/widgets/info_row.dart';
import 'package:booking_tour_flutter/presentation/profile/detail_paid_schedule/widgets/info_two_row.dart';
import 'package:booking_tour_flutter/presentation/profile/detail_paid_schedule/widgets/text_confirm_cancel_schedule.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:flutter/material.dart';

class DetailPaidScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Du lịch vũng tàu")),
      body: CustomScrollView(
        slivers: [
          //tour
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.backgroundAppBarTheme,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/images/destination_place.png',
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                      "Chuyến đi Phú Quốc 3N",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/code.png',
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                      "Mã chuyến đi: CD23TT3",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: AppColors.white),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/calender.png',
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                      "15/10/2025 - 17/10/2025",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: AppColors.white),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/start_place.png',
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                      "Khởi hành từ Tp. Hồ Chí Minh",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //booking
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InfoRow(
                    label: Text(
                      "Loại thanh toán",
                      style: Theme.of(context).textTheme.bodyLarge!,
                    ),
                    content: Text(
                      "Cọc",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.warning,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InfoRow(
                    label: Text("Tổng số tiền"),
                    content: Text("1.000.000 VND"),
                  ),
                  InfoRow(
                    label: Text("Email"),
                    content: Text("myEmail@gmail.com"),
                  ),
                  InfoRow(
                    label: Text("Số điện thoại"),
                    content: Text("0938372837"),
                  ),
                  InfoRow(
                    label: Text("Tổng số người"),
                    content: Text("10 người"),
                  ),
                ],
              ),
            ),
          ),
          //total money
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: InfoTwoRow(
                title: "Tổng số tiền",
                content: "1.500.000 VNĐ",
              ),
            ),
          ),

          //total paid
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: InfoTwoRow(
                title: "Số tiền đã thanh toán",
                content: "1.000.000 VNĐ",
              ),
            ),
          ),

          //money have to pay left
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: InfoTwoRow(
                title: "Số tiền còn lại",
                content: "1.000.000 VNĐ",
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 20)),

          SliverToBoxAdapter(
            child: SizedBox(
              child: Center(
                child: BkButton(
                  onPressed: () async {},
                  title: "Đổi chuyến đi",
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: Center(
                child: BkButton(
                  onPressed: () async {
                    var result = await DialogHelper.showConfirmDialog(
                      body: TextConfirmCancelSchedule(),
                    );

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("${result}")));
                  },
                  title: "Hủy chuyến đi",
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  backgroundColor: AppColors.warning,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
