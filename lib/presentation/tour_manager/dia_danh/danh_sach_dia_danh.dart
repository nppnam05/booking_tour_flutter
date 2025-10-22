import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/domain/location.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/cubit/dia_danh_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/cubit/dia_danh_state.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/dia_danh_demo.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/delete_button_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/drawer_bar/drawer_bar.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/dropdown_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DanhSachDiaDanhScreen extends StatelessWidget {
  final _cubit = DiaDanhCubit()..syncLocation();


  @override
  Widget build(BuildContext context) {
    
    final List<DiaDanh> danhSachDiaDanh = [
      DiaDanh(tenDiaDanh: "Hồ Hoàn Kiếm", tinhThanh: "Hà Nội"),
      DiaDanh(tenDiaDanh: "Bà Nà Hills", tinhThanh: "Đà Nẵng"),
      DiaDanh(tenDiaDanh: "Nhà thờ Đức Bà", tinhThanh: "TP. Hồ Chí Minh"),
      DiaDanh(tenDiaDanh: "Thung lũng Tình Yêu", tinhThanh: "Đà Lạt"),
      DiaDanh(tenDiaDanh: "Vịnh Hạ Long", tinhThanh: "Quảng Ninh"),
    ];

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
          builder: (context, state) {
            final danhSachTinhThanh = state.locations;
            print("danh sach ${danhSachTinhThanh.length}");
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.gray),
                  ),
                  child: Column(
                    children: [
                      _buildSearch(),
                      _buildTinhThanh(danhSachTinhThanh),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListView.builder(
                      itemCount: danhSachDiaDanh.length,
                      itemBuilder: (context, index) {
                        final tour = danhSachDiaDanh[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ListDiaDanhItem(
                            diaDanh: tour,
                            onDelete: () {
                              print("hello");
                            },
                            onSua: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.suaDiaDanh,
                              );
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

  Widget _buildTinhThanh(List<Location> danhSachTinhThanh) {
    String? selectedProvince;

    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: DropDownWidget(
        title: "Tỉnh",
        options: danhSachTinhThanh,
        itemToString: (item) => item.name,
        onChanged: (value) {
          selectedProvince = value!.name;
        },
      ),
    );
  }

  Widget _buildSearch() {
    final TextEditingController _searchController = TextEditingController();

    void _onClear() {
      _searchController.clear(); // Xoá text
    }

    return SearchBarWidget(
      controller: _searchController,
      onClear: _onClear,
      hintText: "Tìm kiếm địa danh",
    );
  }
}

class ListDiaDanhItem extends StatelessWidget {
  final DiaDanh diaDanh;
  final VoidCallback onDelete;
  final VoidCallback onSua;

  const ListDiaDanhItem({
    super.key,
    required this.diaDanh,
    required this.onDelete,
    required this.onSua,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIconText(
                      Icons.location_on,
                      Colors.red,
                      "Tên địa danh: ${diaDanh.tenDiaDanh}",
                    ),
                    const SizedBox(height: 8),
                    _buildIconText(
                      Icons.park,
                      Colors.green,
                      "Tỉnh thành: ${diaDanh.tinhThanh}",
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DeleteButtonWidget(
                    onDelete: onDelete,
                    text: "Xoá",
                    textColor: AppColors.white,
                  ),
                  DeleteButtonWidget(
                    onDelete: onSua,
                    text: "Sửa",
                    backgroundColor: AppColors.borderButton,
                    textColor: AppColors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    var tmp = text.split(" ");
    var limitedWords = tmp.length > 6 ? tmp.sublist(0, 6) : tmp;
    var str = limitedWords.join(" ");
    if (tmp.length > 6) str += " ...";

    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 4),
        Text(str, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
