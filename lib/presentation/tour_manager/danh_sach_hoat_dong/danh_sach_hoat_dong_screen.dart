import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/danh_sach_hoat_dong_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/danh_sach_hoat_dong_state.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/sua_xoa_dia_diem_hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DanhSachHoatDongScreen extends StatefulWidget {
  const DanhSachHoatDongScreen({super.key});

  @override
  State<DanhSachHoatDongScreen> createState() => _DanhSachHoatDongScreenState();
}

class _DanhSachHoatDongScreenState extends State<DanhSachHoatDongScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late final DanhSachHoatDongCubit _cubit;
  Place? _selectedPlace;

  @override
  void initState() {
    super.initState();
    _cubit = DanhSachHoatDongCubit();
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
                icon: const Icon(Icons.menu, color: AppColors.white),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text(
                'Danh Sách Địa Điểm Hoạt Động',
                style: TextStyle(color: AppColors.white),
              ),
              backgroundColor: AppColors.button,
              centerTitle: true,
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
              _buildHeaderInfo(_selectedPlace ?? state.danhSachHoatDong.first),
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
                              ElevatedButton.icon(
                                onPressed: () => _navigateToAddScreen(),
                                icon: const Icon(Icons.add),
                                label: const Text('Thêm hoạt động'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.button,
                                  foregroundColor: AppColors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
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
                                  final place = state.danhSachHoatDong[index];
                                  return _buildListItem(place);
                                },
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              child: ElevatedButton.icon(
                                onPressed: () => _navigateToAddScreen(),
                                icon: const Icon(Icons.add),
                                label: const Text('Thêm hoạt động'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.button,
                                  foregroundColor: AppColors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
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

  Widget _buildListItem(Place place) {
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
          place.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppFonts.fontSize16,
          ),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'edit':
                _navigateToEditScreen(place);
                break;
              case 'delete':
                _showDeleteDialog(place);
                break;
            }
          },
          itemBuilder:
              (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: AppColors.button),
                      SizedBox(width: 8),
                      Text('Sửa'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Xóa'),
                    ],
                  ),
                ),
              ],
        ),
        onTap: () => _updateHeaderInfo(place),
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

  Future<void> _navigateToEditScreen(Place place) async {
    _cubit.setPlaceSelected(place);
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => BlocProvider.value(
              value: _cubit,
              child: const SuaDiaDiemHoatDongScreen(),
            ),
      ),
    );
    if (mounted) {
      _cubit.getDanhSachHoatDong();
    }
  }

  void _showDeleteDialog(Place place) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Xác nhận xóa'),
            content: Text('Bạn có chắc chắn muốn xóa "${place.name}"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Hủy'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _cubit.setPlaceSelected(place);
                  _cubit.xoaHoatDong();
                },
                child: const Text('Xóa', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  Widget _buildHeaderInfo(Place place) {
    return Container(
      color: AppColors.button.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 8),
        child: Column(
          children: [
            _buildInfoRow("Tên địa danh:", place.name),
            const SizedBox(height: 16),
            _buildInfoRow("Tỉnh thành:", place.province.name),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _updateHeaderInfo(Place place) {
    setState(() {
      _selectedPlace = place;
    });
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
