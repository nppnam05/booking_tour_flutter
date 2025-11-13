import 'package:booking_tour_flutter/app/dependency_injection/format_date_number.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/domain/review.dart';
import 'package:booking_tour_flutter/domain/schedule_tourmanager.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/book_a_schedule/cubit/book_schedule_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/chi_tiet_lich_trinh.dart/cubit/chi_tiet_lich_trinh_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/chi_tiet_lich_trinh.dart/cubit/chi_tiet_lich_trinh_state.dart';
import 'package:booking_tour_flutter/presentation/user/schedule_detail/cubit/schedule_detail_cubit.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChiTietLichTrinhScreen extends StatelessWidget {
  const ChiTietLichTrinhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final schedule = arguments['scheduleTourmanager'] as ScheduleTourmanager;
    final tour = schedule.tour;
    final userId = context.read<AuthCubit>().userId;
    return BlocProvider(
      create: (context) => ChiTietLichTrinhCubit()..loadRviews(tour.id, userId),
      child: Scaffold(
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
                      child: Row(
                        children: [
                          Icon(Icons.group, size: 20),
                          const SizedBox(width: 6),
                          Text("${schedule.maxSlot} người"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          Icon(Icons.money, size: 20),
                          const SizedBox(width: 6),
                          Text(
                            "${NumberFormat("#,###", "vi_VN").format(tour.price)} VNĐ / người",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: AppFonts.fontSize14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.delete,
                            size: 20,
                          ),
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
                            Icon(
                              Icons.location_on,
                              color: AppColors.delete,
                              size: 20,
                            ),
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
                      onTap: () async {
                        var cubit = context.read<ScheduleDetailCubit>();

                        cubit.setIdSchedule(schedule.id);

                        cubit.loadData();

                        await Navigator.pushNamed(
                          context,
                          RouteName.scheduleDetail,
                        );
                      },
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

                    Text('Mô tả: ${tour.description}'),

                    const SizedBox(height: 20),
                    Text(
                      "Đánh giá",
                      style: TextStyle(
                        fontSize: AppFonts.fontSize20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    BlocBuilder<ChiTietLichTrinhCubit, ChiTietLichTrinhState>(
                      builder: (context, state) {
                        final reviews = state.reviews;
                        final averageRating =
                            reviews.isNotEmpty
                                ? reviews
                                        .map((r) => r.rating)
                                        .reduce((a, b) => a + b) /
                                    reviews.length
                                : 0.0;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  averageRating.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: AppFonts.fontSize20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                _buildStarRating(averageRating, size: 20),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ...reviews.take(5).map((review) {
                              return _buildReviewItem(review, context, userId);
                            }),

                            if (reviews.length > 2)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    // TODO: đến màn hình review
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Xem thêm >",
                                        style: TextStyle(
                                          fontSize: AppFonts.fontSize14,
                                          color: AppColors.gray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: BkButton(
                        onPressed: () async {
                          var cubit = context.read<BookScheduleCubit>();

                          cubit.setIdSchedule(schedule.id);

                          cubit.loadData();

                          await Navigator.pushNamed(
                            context,
                            RouteName.bookSchedule,
                          );
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
      ),
    );
  }

  Widget _buildStarRating(double rating, {double size = 16}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return Icon(Icons.star, color: AppColors.warning, size: size);
        } else if (index < rating) {
          return Icon(Icons.star_half, color: AppColors.warning, size: size);
        } else {
          return Icon(Icons.star_border, color: AppColors.gray, size: size);
        }
      }),
    );
  }

  Widget _buildReviewItem(Review review, BuildContext context, userId) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review.user.name,
                style: TextStyle(
                  fontSize: AppFonts.fontSize16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  final cubit = context.read<ChiTietLichTrinhCubit>();

                  cubit.postHelpFul(userId, review.id);
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Hữu ích",
                        style: TextStyle(
                          fontSize: AppFonts.fontSize14,
                          color:
                              review.isHelpful
                                  ? AppColors.black
                                  : AppColors.gray,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        review.isHelpful
                            ? Icons.thumb_up
                            : Icons.thumb_up_outlined,
                        size: 18,
                        color:
                            review.isHelpful
                                ? AppColors.warning
                                : AppColors.gray,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          _buildStarRating(review.rating.toDouble()),
          const SizedBox(height: 8),

          Text(review.content, style: TextStyle(fontSize: AppFonts.fontSize14)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Hướng dẫn viên: ${review.guide.staffId}")],
          ),
        ],
      ),
    );
  }
}
