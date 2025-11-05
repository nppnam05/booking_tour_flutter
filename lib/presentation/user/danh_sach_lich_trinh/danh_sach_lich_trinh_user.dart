import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_lich_trinh/lich_trinh_user.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:flutter/material.dart';

class DanhSachLichTrinhUser extends StatefulWidget {
  const DanhSachLichTrinhUser({super.key});

  @override
  State<StatefulWidget> createState() => DanhSachLichTrinhUserState();
}

class DanhSachLichTrinhUserState extends State<DanhSachLichTrinhUser> {
  // Dữ liệu giả
  final List<LichTrinhUser> danhSachLichTrinh = [
    LichTrinhUser(
      hinhAnh:
          "https://images.unsplash.com/photo-1583417319070-4a69db38a482?w=800",
      tenDiaDiem: "Đà Lạt",
      soNguoi: 12,
      soNgay: 2,
      diaDiem: "Thành phố Đà Lạt",
      ngayBatDau: DateTime(2025, 10, 21),
      ngayKetThuc: DateTime(2025, 10, 22),
      gia: 2800000,
      daDat: true,
    ),
    LichTrinhUser(
      hinhAnh:
          "https://images.unsplash.com/photo-1559592413-7cec4d0cae2b?w=800",
      tenDiaDiem: "Hạ Long",
      soNguoi: 15,
      soNgay: 3,
      diaDiem: "Vịnh Hạ Long",
      ngayBatDau: DateTime(2025, 11, 5),
      ngayKetThuc: DateTime(2025, 11, 7),
      gia: 4500000,
      daDat: false,
    ),
    LichTrinhUser(
      hinhAnh:
          "https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?w=800",
      tenDiaDiem: "Phú Quốc",
      soNguoi: 20,
      soNgay: 4,
      diaDiem: "Đảo Phú Quốc",
      ngayBatDau: DateTime(2025, 11, 15),
      ngayKetThuc: DateTime(2025, 11, 18),
      gia: 6200000,
      daDat: true,
    ),
    LichTrinhUser(
      hinhAnh:
          "https://images.unsplash.com/photo-1556530611-5f04c3f0f1b9?w=800",
      tenDiaDiem: "Nha Trang",
      soNguoi: 18,
      soNgay: 3,
      diaDiem: "Thành phố Nha Trang",
      ngayBatDau: DateTime(2025, 12, 1),
      ngayKetThuc: DateTime(2025, 12, 3),
      gia: 3900000,
      daDat: false,
    ),
    LichTrinhUser(
      hinhAnh:
          "https://images.unsplash.com/photo-1555841769-7f7d2f0e7c06?w=800",
      tenDiaDiem: "Sapa",
      soNguoi: 10,
      soNgay: 2,
      diaDiem: "Thị trấn Sapa",
      ngayBatDau: DateTime(2025, 12, 10),
      ngayKetThuc: DateTime(2025, 12, 11),
      gia: 3200000,
      daDat: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking tour"), centerTitle: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: Text(
              "Lịch trình sắp tới",
              style: TextStyle(
                fontSize: AppFonts.fontSize18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: danhSachLichTrinh.length,
              itemBuilder: (context, index) {
                return _buildLichTrinhCard(danhSachLichTrinh[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLichTrinhCard(LichTrinhUser lichTrinh) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary,
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              lichTrinh.hinhAnh,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: AppColors.white,
                  child: Icon(Icons.image, size: 50, color: AppColors.gray),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lichTrinh.tenDiaDiem,
                  style: TextStyle(
                    fontSize: AppFonts.fontSize18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),

                _buildInfoRow(
                  "Số người :",
                  "${lichTrinh.soNguoi}/${lichTrinh.soNguoi}",
                ),
                SizedBox(height: 8),
                _buildInfoRow("Thời gian :", "${lichTrinh.soNgay} ngày"),
                SizedBox(height: 8),
                _buildInfoRow("Địa điểm :", lichTrinh.diaDiem),
                SizedBox(height: 8),
                _buildInfoRow(
                  "Thời gian bắt đầu :",
                  "${lichTrinh.ngayBatDau.day}/${lichTrinh.ngayBatDau.month}/${lichTrinh.ngayBatDau.year}",
                ),
                SizedBox(height: 8),
                _buildInfoRow(
                  "Thời gian kết thúc :",
                  "${lichTrinh.ngayKetThuc.day}/${lichTrinh.ngayKetThuc.month}/${lichTrinh.ngayKetThuc.year}",
                ),
                SizedBox(height: 8),
                Text(
                  "${lichTrinh.gia} VNĐ/ 1 người",
                  style: TextStyle(
                    fontSize: AppFonts.fontSize14,
                    color: AppColors.delete,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BkButton(
                      onPressed: () {},
                      title: "Chi tiết",
                      backgroundColor: AppColors.borderButton,
                      borderRadius: 32,
                    ),
                    const SizedBox(width: 8),
                    BkButton(
                      onPressed: () {},
                      title: "Đặt ngay",
                      borderRadius: 32,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: AppFonts.fontSize14,
              color: AppColors.gray,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(
              fontSize: AppFonts.fontSize14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
