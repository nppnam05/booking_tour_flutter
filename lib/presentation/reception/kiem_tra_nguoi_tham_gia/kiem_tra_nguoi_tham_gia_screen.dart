import 'package:booking_tour_flutter/app/app_navigator.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/domain/user_completed_schedule.dart';
import 'package:booking_tour_flutter/presentation/reception/kiem_tra_nguoi_tham_gia/cubit/kiem_tra_nguoi_tham_gia_cubit.dart';
import 'package:booking_tour_flutter/presentation/reception/kiem_tra_nguoi_tham_gia/cubit/kiem_tra_nguoi_tham_gia_state.dart';
import 'package:booking_tour_flutter/presentation/reception/xac_nhan_so_nguoi_tham_gia/cubit/xac_nhan_so_nguoi_tham_gia_cubit.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/delete_button_widget.dart';
import 'package:booking_tour_flutter/presentation/widgets_dialog/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KiemTraNguoiThamGiaScreen extends StatelessWidget {
  final _cubit = KiemTraNguoiThamGiaCubit();

  KiemTraNguoiThamGiaScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    _cubit.syncBooking(22);

    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(title: Text("Kiểm tra người tham gia")),
        body: BlocBuilder<KiemTraNguoiThamGiaCubit, KiemTraNguoiThamGiaState>(
          builder: (context, state) {
            if(state.isLoading == true){
              LoadingDialog();
            }
            return buildListPeople(state.userCompletedSchedule);
          },
        ),
        backgroundColor: AppColors.secondary,
      ),
    );
  }

  Widget buildListPeople(List<UserCompletedSchedule> userCompletedSchedules) {
    return ListView.builder(
      itemCount: userCompletedSchedules.length,
      itemBuilder: (context, index) {
        final userCompletedSchedule = userCompletedSchedules[index];
        if (userCompletedSchedule.booking!.status.id != 1) {
          return buildCard(context, userCompletedSchedule);
        }
      },
    );
  }

  Widget buildCard(
    BuildContext context,
    UserCompletedSchedule userCompletedSchedule,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 180,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (userCompletedSchedule.booking!.status.id == 2) ...[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "${userCompletedSchedule.booking!.status.name}",
                        style: AppFonts.text14.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
                if (userCompletedSchedule.booking!.status.id == 3) ...[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "${userCompletedSchedule.booking!.status.name}",
                        style: AppFonts.text14.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: ClipOval(
                    child: Image.network(
                      userCompletedSchedule.booking!.user.avatarPath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(color: Colors.black);
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Tên: ",
                          style: AppFonts.text14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userCompletedSchedule.booking!.user.name,
                          style: AppFonts.text14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Số tiền phải trả: ",
                          style: AppFonts.text14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${(userCompletedSchedule.booking!.schedule.finalPrice * userCompletedSchedule.booking!.numPeople) - (userCompletedSchedule.booking!.totalPrice)}",
                          style: AppFonts.text14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " vnd",
                          style: AppFonts.text14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Số người tham gia: ",
                          style: AppFonts.text14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${userCompletedSchedule.booking!.numPeople}",
                          style: AppFonts.text14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " người",
                          style: AppFonts.text14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "SĐT: ",
                          style: AppFonts.text14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userCompletedSchedule.booking!.phone,
                          style: AppFonts.text14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (userCompletedSchedule.countPeople == 0) ...[
                  DeleteButtonWidget(
                    onDelete: () async {
                      context.read<XacNhanSoNguoiThamGiaCubit>().setUserCompletedSchedule(userCompletedSchedule);
                      await Navigator.pushNamed(
                        AppNavigator.currentContext,
                        RouteName.xacNhanSoNguoiThamGia,
                      );
                      _cubit.syncBooking(userCompletedSchedule.booking!.schedule.id);
                    },
                    text: "Xác nhận chưa tham gia",
                    backgroundColor: AppColors.delete,
                  ),
                ],
                if(userCompletedSchedule.countPeople != 0) ... [
                  DeleteButtonWidget(
                    onDelete: () async {
                      context.read<XacNhanSoNguoiThamGiaCubit>().setUserCompletedSchedule(userCompletedSchedule);
                      await Navigator.pushNamed(
                        AppNavigator.currentContext,
                        RouteName.xacNhanSoNguoiThamGia,
                      );
                      _cubit.syncBooking(userCompletedSchedule.booking!.schedule.id);
                    },
                    text: "Xác nhận tham gia",
                    backgroundColor: AppColors.button,
                  ),
                ],
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
