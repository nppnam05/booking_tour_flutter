import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_dia_diem_hoat_dong/them_dia_diem_hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/sua_dia_diem_hoat_dong/sua_dia_diem_hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:flutter/material.dart';

class DanhSachHoatDongScreen extends StatefulWidget {
  const DanhSachHoatDongScreen({super.key});

  @override
  State<DanhSachHoatDongScreen> createState() => _DanhSachHoatDongScreenState();
}

class _DanhSachHoatDongScreenState extends State<DanhSachHoatDongScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  // TODO: Lấy Danh sách hoạt động từ Api gắn vào đây
  List<String> activities = [
    'Bà Nà Hills',
    'Phố cổ Hội An',
    'Đà Nẵng',
    'Sông Hàn',
    'Cù Lao Chàm',
    'Ngũ Hành Sơn',
    'Bảo tàng Chăm',
    'Mỹ Khê',
    'Lễ hội pháo hoa quốc tế',
    'Đỉnh Bạch Mã',
  ];
  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.white),
          onPressed: () {
            //TODO: trở về màn hình trước
          },
        ),
        title: const Text(
          'Danh Sách Hoạt Động',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.button,
        centerTitle: true,
      ),
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: Container(
          color: AppColors.white,
          child: Column(
            children: [
              Container(
                color: AppColors.button.withOpacity(0.2),
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(width: 4),
                              Text(
                                "Tên địa danh:",
                                style: TextStyle(
                                  fontSize: AppFonts.fontSize16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Text(
                              "Bà nà hill",
                              style: TextStyle(
                                fontSize: AppFonts.fontSize16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(width: 4),
                              Text(
                                "Tỉnh thành:",
                                style: TextStyle(
                                  fontSize: AppFonts.fontSize16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Text(
                              "Đà nẵng",
                              style: TextStyle(
                                fontSize: AppFonts.fontSize16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                  child: ListView.builder(
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(
                            color: AppColors.secondary.withOpacity(0.2),
                          ),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text(
                            activities[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFonts.fontSize16,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => SuaDiaDiemHoatDongScreen(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThemDiaDiemHoatDongScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("Thêm", style: TextStyle(color: AppColors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
