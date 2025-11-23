import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/presentation/admin/tourguide_rating/cubit/tourguide_rating_cubit.dart';
import 'package:booking_tour_flutter/presentation/admin/tourguide_rating/cubit/tourguide_rating_state.dart';
import 'package:booking_tour_flutter/presentation/admin/tourguide_rating/schedule_staff_card.dart';
import 'package:booking_tour_flutter/presentation/widgets/filter_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TourguideRatingScreen extends StatefulWidget {
  const TourguideRatingScreen({super.key});

  @override
  State<TourguideRatingScreen> createState() => _TourguideRatingScreenState();
}

class _TourguideRatingScreenState extends State<TourguideRatingScreen> {
  final TextEditingController _searchController = TextEditingController();
  late final TourguideRatingCubit _cubit;

  @override
  void initState() {
    super.initState();
   
    _cubit = TourguideRatingCubit(getIt<BookingRepository>());
    _cubit.loadSchedules();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _cubit.close();
    super.dispose();
  }

  void _showFilterBottomSheet(TourguideRatingLoaded state) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheet(
        initialProvinceId: state.provinceId,
        initialProvinceName: state.provinceName,
        initialStartDate: state.startDate,
        initialEndDate: state.endDate,
        initialStars: state.stars,
      ),
    ).then((result) {
      if (result != null) {
        _cubit.applyFilter(
          provinceId: result['provinceId'],
          provinceName: result['provinceName'],
          startDate: result['startDate'],
          endDate: result['endDate'],
          stars: result['stars'],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Đánh giá',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundAppBarTheme,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<TourguideRatingCubit, TourguideRatingState>(
        bloc: _cubit, // Dùng bloc local thay vì context.read
        builder: (context, state) {
          if (state is TourguideRatingLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.backgroundAppBarTheme,
              ),
            );
          }

          if (state is TourguideRatingError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 60,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _cubit.loadSchedules();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.backgroundAppBarTheme,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }

          if (state is TourguideRatingLoaded) {
            return Column(
              children: [
                // Header with profile info
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.backgroundAppBarTheme,
                        child: Text(
                          'NTA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Nguyễn Trung Trực',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Hướng dẫn viên',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'ID: NV2024001',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(4, (index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            );
                          }),
                          const Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '(126 đánh giá)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Search and Filter
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm lịch trình',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            suffixIcon: _searchController.text.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      _searchController.clear();
                                      _cubit.searchSchedules('');
                                    },
                                  )
                                : null,
                          ),
                          onSubmitted: (value) {
                            _cubit.searchSchedules(value);
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () => _showFilterBottomSheet(state),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.filter_list),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Schedules List
                Expanded(
                  child: state.schedules.isEmpty
                      ? const Center(
                          child: Text(
                            'Không có lịch trình nào',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: state.schedules.length,
                          itemBuilder: (context, index) {
                            final schedule = state.schedules[index];
                            return ScheduleStaffCard(
                              schedule: schedule,
                              onTap: () {
                                // Navigate to detail screen
                              },
                            );
                          },
                        ),
                ),
              ],
            );
          }

          return const Center(
            child: Text('Có lỗi xảy ra'),
          );
        },
      ),
    );
  }
}