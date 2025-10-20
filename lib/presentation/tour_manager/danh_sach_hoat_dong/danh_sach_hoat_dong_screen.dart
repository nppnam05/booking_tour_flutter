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
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            //TODO: trở về màn hình trước
          },
        ),
        title: const Text(
          'Danh Sách Hoạt Động',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF23A892),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Color(0xFF23A892).withOpacity(0.2),
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
                                  fontSize: 16,
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
                                fontSize: 16,
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
                                  fontSize: 16,
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
                                fontSize: 16,
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
              Container(height: 12, color: Colors.grey.shade200),
              Expanded(
                child: Container(
                  color: Colors.grey.shade200,
                  child: ListView.builder(
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text(
                            activities[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
                    backgroundColor: Color(0xFF23A892),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("Thêm", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
