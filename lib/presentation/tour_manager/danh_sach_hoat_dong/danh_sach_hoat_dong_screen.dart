import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/domain/location_activity.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/danh_sach_hoat_dong_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/danh_sach_hoat_dong_state.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DanhSachHoatDongScreen extends StatefulWidget {
  final int? placeId;

  const DanhSachHoatDongScreen({super.key, this.placeId});

  @override
  State<DanhSachHoatDongScreen> createState() => _DanhSachHoatDongScreenState();
}

class _DanhSachHoatDongScreenState extends State<DanhSachHoatDongScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late final DanhSachHoatDongCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = DanhSachHoatDongCubit(placeId: widget.placeId);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<DanhSachHoatDongCubit, DanhSachHoatDongState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.white),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text(
                'Danh Sách Địa Điểm Hoạt Động',
                style: TextStyle(color: AppColors.white),
              ),
              backgroundColor: AppColors.button,
              centerTitle: true,
              // actions: [
              //   IconButton(
              //     icon: const Icon(Icons.edit, color: AppColors.white),
              //     onPressed: () => _showEditOptions(context),
              //   ),
              // ],
            ),
            backgroundColor: AppColors.white,
            body:
                state.status == DanhSachHoatDongStatus.loading
                    ? const Center(child: CircularProgressIndicator())
                    : _buildBody(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(DanhSachHoatDongState state) {
    return GestureDetector(
      onTap: () => _focusNode.unfocus(),
      child: Container(
        color: AppColors.white,
        child: Column(
          children: [
            if (state.danhSachHoatDong.isNotEmpty)
              _buildHeaderInfo(state.danhSachHoatDong.first),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: SearchBarWidget(
                hintText: 'Tìm kiếm...',
                controller: _controller,
                onClear: _controller.clear,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                color: AppColors.secondary.withOpacity(0.2),
                child:
                    state.danhSachHoatDong.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_off,
                                size: 64,
                                color: AppColors.secondary.withOpacity(0.5),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Chưa có hoạt động nào',
                                style: TextStyle(
                                  fontSize: AppFonts.fontSize16,
                                  color: AppColors.secondary.withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Center(
                                child: BkButton(
                                  onPressed: () => _navigateToAddScreen(),
                                  title: 'Thêm hoạt động',
                                  backgroundColor: AppColors.button,
                                  textStyle: const TextStyle(
                                    fontSize: AppFonts.fontSize16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  borderRadius: 8,
                                ),
                              ),
                            ],
                          ),
                        )
                        : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.danhSachHoatDong.length,
                                itemBuilder: (context, index) {
                                  final locationActivity =
                                      state.danhSachHoatDong[index];
                                  return _buildListItem(locationActivity);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 16,
                                top: 16,
                              ),
                              child: Center(
                                child: BkButton(
                                  onPressed: () => _navigateToAddScreen(),
                                  title: 'Thêm hoạt động',
                                  backgroundColor: AppColors.button,
                                  textStyle: const TextStyle(
                                    fontSize: AppFonts.fontSize16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                  borderRadius: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(LocationActivity locationActivity) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.secondary.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: const Icon(Icons.location_on, color: AppColors.button),
        title: Text(
          locationActivity.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppFonts.fontSize16,
          ),
        ),
      ),
    );
  }

  Future<void> _navigateToAddScreen() async {
    final result = await Navigator.pushNamed(
      context,
      RouteName.themDiaDiemHoatDong,
    );

    if (mounted) {
      _cubit.getDanhSachHoatDong();
    }
  }

  // Future<void> _navigateToEditScreen(LocationActivity locationActivity) async {
  //   _cubit.setLocationActivitySelected(locationActivity);
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder:
  //           (context) => BlocProvider.value(
  //             value: _cubit,
  //             child: const Text("SuaXoaDiaDiemHoatDongScreen(),"),
  //           ),
  //     ),
  //   );
  //   if (mounted) {
  //     _cubit.getDanhSachHoatDong();
  //   }
  // }

  Widget _buildHeaderInfo(LocationActivity locationActivity) {
    return Container(
      color: AppColors.button.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 8),
        child: Column(
          children: [
            _buildInfoRow("Địa điểm:", locationActivity.place.name),
            const SizedBox(height: 16),
            _buildInfoRow("Tỉnh thành:", locationActivity.place.location.name),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.location_on),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: AppFonts.fontSize16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: AppFonts.fontSize16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
