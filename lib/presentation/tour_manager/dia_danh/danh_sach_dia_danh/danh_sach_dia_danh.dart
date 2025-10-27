import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/danh_sach_dia_danh/cubit/dia_danh_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/danh_sach_dia_danh/cubit/dia_danh_state.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/danh_sach_dia_danh/list_danh_sach_dia_danh.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/delete_button_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/drawer_bar/drawer_bar.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/pick_image_button/search_bar_new.dart';
import 'package:booking_tour_flutter/presentation/widgets_dialog/dialog_noti.dart';
import 'package:booking_tour_flutter/presentation/widgets_dialog/generic_selected_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DanhSachDiaDanhScreen extends StatelessWidget {
  final _cubit = DiaDanhCubit()..syncProvinces();
  final TextEditingController _searchController = TextEditingController();

  DanhSachDiaDanhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Địa danh", style: AppFonts.textWhite),
          backgroundColor: AppColors.button,
          centerTitle: true,
        ),
        drawer: DrawerBar(),

        body: BlocBuilder<DiaDanhCubit, DiaDanhState>(
          bloc: _cubit,
          builder: (context, state) {
            final cubit = context.read<DiaDanhCubit>();
            var danhSachDiaDanh = state.filteredPlaces ?? state.places;
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.gray),
                  ),
                  child: Column(
                    children: [
                      _buildSearch(context),

                      _buildTinhThanh(
                        context,
                        state.provinces,
                        state.selectedProvince,
                        (value) {
                          cubit.selectProvinces(value);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListView.builder(
                      itemCount: danhSachDiaDanh.length,
                      itemBuilder: (context, index) {
                        final place = danhSachDiaDanh[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ListDiaDanhItem(
                            diaDanh: place,
                            onDelete: () async {
                              final confirm = await DialogNoti.confirm(
                                context: context,
                                title: "Xác nhận xoá",
                                confirmText: "Xác nhận",
                                cancelText: "Huỷ",
                                message:
                                    "Bạn có chắc chắn muốn xoá \n địa danh ${place.name} không?",
                                highlightPhrases: [place.name],
                              );
                              // huỷ
                              if (!confirm) return;

                              try {
                                await cubit.deletePlace(place.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Xoá thành công")),
                                );
                                cubit.reloadPlaces();
                              } catch (_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Xoá thất bại")),
                                );
                              }
                            },

                            onSua: () async {
                              final result = await Navigator.pushNamed(
                                context,
                                RouteName.suaDiaDanh,
                                arguments: place,
                              );

                              // Neu ma sua xong thi no phai reload lai danh sahc
                              if (result == true) {
                                context.read<DiaDanhCubit>().reloadPlaces();
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Nút thêm tại dùng lại layout của nút xoá
                DeleteButtonWidget(
                  onDelete: () {
                    Navigator.pushNamed(context, RouteName.themDiaDanh);
                  },
                  text: "+ Thêm",
                  textColor: Colors.white,
                  backgroundColor: AppColors.button,
                ),
                SizedBox(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTinhThanh(
    BuildContext context,
    List<Province> danhSachTinhThanh,
    Province? selectedProvince,
    ValueChanged<Province?> onChanged,
  ) {
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: InkWell(
        onTap: () async {
          final Province? result = await showDialog(
            context: context,
            builder:
                (_) => SelectionDialog<Province>(
                  title: "Chọn Tỉnh",
                  items: danhSachTinhThanh,
                  display: (p) => p.name,
                  isMultiSelect: false,
                  preSelectedItems:
                      selectedProvince != null ? [selectedProvince] : [],
                ),
          );
          if (result != null) {
            onChanged(result);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.secondary),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedProvince?.name ?? "Chọn tỉnh",
                style: AppFonts.text16,
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch(BuildContext context) {
    final diaDanhCubit = context.read<DiaDanhCubit>();

    void _onClear() {
      _searchController.clear();
      diaDanhCubit.filterPlaces("");
    }

    return SearchBarNewWidget(
      controller: _searchController,
      onClear: _onClear,
      hintText: "Tìm kiếm địa danh",
      onChanged: (value) => diaDanhCubit.filterPlaces(value),
    );
  }
}
