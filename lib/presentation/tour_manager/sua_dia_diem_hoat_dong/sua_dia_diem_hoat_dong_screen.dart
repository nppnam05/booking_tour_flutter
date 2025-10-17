import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/danh_sach_hoat_dong_screen.dart';
import 'package:flutter/material.dart';

class SuaDiaDiemHoatDongScreen extends StatefulWidget {
  const SuaDiaDiemHoatDongScreen({super.key});

  @override
  State<SuaDiaDiemHoatDongScreen> createState() =>
      _SuaDiaDiemHoatDongScreenState();
}

class _SuaDiaDiemHoatDongScreenState extends State<SuaDiaDiemHoatDongScreen> {
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
      body: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            'Sửa Địa Điểm Hoạt Động',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: DropDownWidget(
            //   title: 'Danh sách hoạt động',
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
                'Lưu',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
