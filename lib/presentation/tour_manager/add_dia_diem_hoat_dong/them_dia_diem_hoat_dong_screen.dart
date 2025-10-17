import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/danh_sach_hoat_dong_screen.dart';
import 'package:flutter/material.dart';

class ThemDiaDiemHoatDongScreen extends StatefulWidget {
  const ThemDiaDiemHoatDongScreen({super.key});

  @override
  State<ThemDiaDiemHoatDongScreen> createState() =>
      _ThemDiaDiemHoatDongScreenState();
}

class _ThemDiaDiemHoatDongScreenState extends State<ThemDiaDiemHoatDongScreen> {
  List<String> selectedProvinces = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DanhSachHoatDongScreen()),
            );
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
      body: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            'Thêm Địa Điểm Hoạt Động',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: DropDownWidget(
            //   title: 'Danh Sách Hoạt Động',
            //   options: const [
            //     'Quảng Ninh',
            //     'Hồ Chí Minh',
            //     'Vũng Tàu',
            //     'Hà Nội',
            //     'Huế',
            //     'Đà Nẵng',
            //     'Bình Dương',
            //   ],
            //   mode: SelectMode.multiple,
            //   onChanged: (values) {
            //     setState(() => selectedProvinces = values);
            //   },
            // ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ElevatedButton(
              onPressed: () {
                //TODO: Xử lý khi nhấn nút Lưu
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF23A892),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Thêm',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
