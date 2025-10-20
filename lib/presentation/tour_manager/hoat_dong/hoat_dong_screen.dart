import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/hoat_dong/widget/dialog_hoat_dong.dart';
import 'package:flutter/material.dart';

class HoatDongScreen extends StatefulWidget {
  const HoatDongScreen({super.key});

  @override
  State<HoatDongScreen> createState() => _HoatDongScreenState();
}

class _HoatDongScreenState extends State<HoatDongScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  // TODO: Lấy Danh sách hoạt động từ Api gắn vào đây
  List<String> activities = [
    'leo núi',
    'bơi lội',
    'chơi cầu lông',
    'đi dạo',
    'xem phim',
    'nghe nhạc',
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
          'Hoạt Động',
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
                          title: Text(
                            activities[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFonts.fontSize16,
                            ),
                          ),
                          onTap: () {
                            DialogHoatDong.show(
                              context: context,
                              title: "Sửa hoạt động",
                              showInput: true,
                              onConfirm: (text) {
                                //TODO: Xử lý khi xác nhận sửa hoạt động với text nhập vào
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

              Container(
                color: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    DialogHoatDong.show(
                      context: context,
                      title: "Thêm hoạt động",
                      showInput: true,
                      onConfirm: (text) {
                        //TODO: Xử lý khi xác nhận thêm hoạt động với text nhập vào
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: TextStyle(
                      fontSize: AppFonts.fontSize16,
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
