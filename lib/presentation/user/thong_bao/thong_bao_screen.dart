import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/user/thong_bao/thong_bao.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:flutter/material.dart';

class ThongBaoScreen extends StatefulWidget {
  const ThongBaoScreen({super.key});

  @override
  State<ThongBaoScreen> createState() => _ThongBaoScreenState();
}

class _ThongBaoScreenState extends State<ThongBaoScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<ThongBao> danhSachThongBao = [
    ThongBao(
      thoiGian: DateTime(2025, 10, 19, 10, 25),
      loiThongBao:
          "Quý khách vừa thành tham gia một chuyến đi của Đà Lạc 2 ngày 2 đêm\nNếu quý khách muốn nhận các ưu đãi về du lịch bên chúng tôi, quý khách sẽ đc không nhận kế sổ tiền nay vận lý của quý khách:\nLiên hệ để thanh toán, chúng tôi đề tòu sẽ chắm tác vận lý của quý khách\nChúng tôi rất vinh hạn để liên các của quý khách",
    ),
    ThongBao(
      thoiGian: DateTime(2025, 10, 18, 10, 25),
      loiThongBao:
          "Quý khách vừa thành toán hoàn chuyến đi của Đà Lạc 2 ngày 2 đêm\nNếu quý khách có thắc mắc hoặc phản ảnh về chỗn dịch vụ bên chúng tôi",
    ),
    ThongBao(
      thoiGian: DateTime(2025, 10, 17, 14, 30),
      loiThongBao:
          "Chuyến du lịch Hạ Long 3 ngày 2 đêm của bạn sẽ bắt đầu vào ngày mai. Vui lòng chuẩn bị hành lý và có mặt đúng giờ tại điểm hẹn.",
    ),
    ThongBao(
      thoiGian: DateTime(2025, 10, 15, 9, 15),
      loiThongBao:
          "Cảm ơn quý khách đã sử dụng dịch vụ của chúng tôi. Chuyến đi Phú Quốc của bạn đã được xác nhận thành công. Chúc quý khách có chuyến đi vui vẻ!",
    ),
    ThongBao(
      thoiGian: DateTime(2025, 10, 12, 16, 45),
      loiThongBao:
          "Khuyến mãi đặc biệt! Giảm 20% cho tất cả các tour du lịch trong tháng 11. Đặt ngay để nhận ưu đãi hấp dẫn này!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông báo", style: TextStyle(color: AppColors.white)),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            SearchBarWidget(
              controller: searchController,
              onClear: searchController.clear,
              hintText: "Tìm kiếm thông báo",
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: danhSachThongBao.length,
                itemBuilder: (context, index) {
                  final thongBao = danhSachThongBao[index];
                  return _buildThongBaoItem(thongBao);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThongBaoItem(ThongBao thongBao) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${thongBao.thoiGian.day}/${thongBao.thoiGian.month}/${thongBao.thoiGian.year} ${thongBao.thoiGian.hour}:${thongBao.thoiGian.minute.toString().padLeft(2, '0')}",
              style: TextStyle(
                fontSize: AppFonts.fontSize12,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              thongBao.loiThongBao,
              style: TextStyle(
                fontSize: AppFonts.fontSize14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Trân trọng !",
                style: TextStyle(
                  fontSize: AppFonts.fontSize14,
                  color: AppColors.borderButton,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
