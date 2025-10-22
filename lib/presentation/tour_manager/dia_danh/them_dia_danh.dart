import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/delete_button_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/dropdown_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_icon_toggle_input_field.dart';
import 'package:flutter/material.dart';

class ThemDiaDanhScreen extends StatelessWidget {
  const ThemDiaDanhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(style: AppFonts.textWhite, "Thêm Địa Danh"),
        backgroundColor: AppColors.button,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.gray),
            ),
            child: Column(children: [ _buildTinhThanh(), _buildTenDiaDanh()]),
          ),

          const Spacer(),

          DeleteButtonWidget(onDelete: (){
            Navigator.pushNamed(context, RouteName.danhSachDiaDanh);
          }, text: "Lưu", textColor: Colors.white, backgroundColor: AppColors.button,),
          SizedBox(height: 50,)
        ],
      ),
    );
  }

  Widget _buildTinhThanh() {
    final List<String> provinces = [
      "Hà Nội",
      "Đà Nẵng",
      "Hồ Chí Minh",
      "Đà Lạt",
    ];
    String? selectedProvince;

    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: DropDownWidget(
        title: "Tỉnh Thành",
        options: provinces,
        itemToString: (item) => item,
        onChanged: (value) {
          selectedProvince = value;
        },
      ),
    );
  }

  Widget _buildTenDiaDanh() {
    final TextEditingController _searchController = TextEditingController();
    return Padding(padding: EdgeInsets.all(12),
    child: notIconToggleInputField(_searchController, "Tên địa danh", AppColors.gray),
    );
    
  }
}
