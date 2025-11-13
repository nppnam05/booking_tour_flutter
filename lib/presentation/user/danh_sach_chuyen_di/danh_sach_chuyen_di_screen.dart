import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_chuyen_di/cubit/danh_sach_chuyen_di_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_chuyen_di/cubit/danh_sach_chuyen_di_state.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_chuyen_di/widget/trip_card.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_chuyen_di/widget/trip_card_detail.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DanhSachChuyenDiScreen extends StatefulWidget {
  const DanhSachChuyenDiScreen({super.key});

  @override
  State<DanhSachChuyenDiScreen> createState() => _DanhSachChuyenDiScreenState();
}

class _DanhSachChuyenDiScreenState extends State<DanhSachChuyenDiScreen> {
  final TextEditingController _searchController = TextEditingController();
  late final DanhSachChuyenDiCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = DanhSachChuyenDiCubit();
  }

  @override
  void dispose() {
    _cubit.close();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthCubit>().userId;
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Booking Tour',
            style: TextStyle(color: AppColors.white),
          ),
          backgroundColor: AppColors.backgroundAppBarTheme,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "thong_bao");
              },
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: BlocBuilder<DanhSachChuyenDiCubit, DanhSachChuyenDiState>(
            bloc: _cubit,
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SearchBarWidget(
                      controller: _searchController,
                      enabled: false,
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.searchTour);
                      },
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 8)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: const Text(
                        'Chuyến đi nổi bật',
                        style: TextStyle(
                          fontSize: AppFonts.fontSize18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 8)),

                  if (state.mostFavoriteTrips.isNotEmpty)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SizedBox(
                          height: 180,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(right: 16),
                            itemBuilder: (context, index) {
                              final trip = state.mostFavoriteTrips[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "danh_sach_lich_trinh_user",
                                    arguments: {
                                      'tourId': trip.id,
                                      'userId': userId,
                                    },
                                  );
                                },
                                child: TripCard(trip: trip),
                              );
                            },
                            separatorBuilder:
                                (_, __) => const SizedBox(width: 12),
                            itemCount: state.mostFavoriteTrips.length,
                          ),
                        ),
                      ),
                    ),

                  const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  if (state.mostRecent.isNotEmpty)
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return TripCardDetail(
                          trip: state.mostRecent[index],
                          userId: userId,
                        );
                      }, childCount: state.mostRecent.length),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
