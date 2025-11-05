import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_chuyen_di/danh_sach_chuyen_di_test.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_chuyen_di/widget/trip_card.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_chuyen_di/widget/trip_card_detail.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:flutter/material.dart';

class DanhSachChuyenDiScreen extends StatefulWidget {
  const DanhSachChuyenDiScreen({super.key});

  @override
  State<DanhSachChuyenDiScreen> createState() => _DanhSachChuyenDiScreenState();
}

class _DanhSachChuyenDiScreenState extends State<DanhSachChuyenDiScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Booking Tour',
          style: TextStyle(color: AppColors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "thong_bao");
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(
              controller: _searchController,
              onClear: _searchController.clear,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: const Text(
                'Chuyến đi nổi bật',
                style: TextStyle(
                  fontSize: AppFonts.fontSize18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final trip = mockTrips[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "danh_sach_lich_trinh_user",
                        );
                      },
                      child: TripCard(trip: trip),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemCount: mockTrips.length,
                ),
              ),
            ),

            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return TripCardDetail(trip: mockTrips[index]);
                },
                itemCount: mockTrips.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<TripTest> mockTrips = [
    TripTest(
      name: 'Du lịch Hạ Long',
      duration: '2 ngày',
      location: 'Hạ Long',
      rating: 5.0,
      reviewCount: 127,
      price: 1500000,
      imageUrl:
          'https://tse4.mm.bing.net/th/id/OIP.5c0bXFDJIfAqJmR1YvU0IAHaE8?pid=Api&P=0&h=180',
      itinerary: [
        'Bay trực thăng ngắm vịnh',
        'Sun World Hạ Long Park',
        'Đảo Titop',
        'Nhà hàng The Night',
        'Quán cà phê The Day',
      ],
    ),
    TripTest(
      name: 'Sapa - Thác Bạc',
      duration: '3N',
      location: 'Sapa',
      rating: 4.8,
      reviewCount: 95,
      price: 2700000,
      imageUrl:
          'https://tse1.mm.bing.net/th/id/OIP.Cg5FvLFwSbuGIRd7JzlgegHaE8?pid=Api&P=0&h=180',
      itinerary: [
        'Tham quan núi Hàm Rồng',
        'Thác Bạc Sapa',
        'Cáp treo Fansipan',
        'Chợ tình Sapa',
        'Ăn tối tại nhà hàng Fansipan View',
      ],
    ),
    TripTest(
      name: 'Cố đô Huế',
      duration: '3N/2D',
      location: 'Huế',
      rating: 4.9,
      reviewCount: 110,
      price: 2700000,
      imageUrl:
          "https://tse4.mm.bing.net/th/id/OIP.6vegiBkBa9EsVDN-VpcfcwHaDt?pid=Api&P=0&h=180",
      itinerary: [
        'Đại Nội Huế',
        'Chùa Thiên Mụ',
        'Sông Hương – cầu Trường Tiền',
        'Ẩm thực Huế tại quán Mụ Đỏ',
      ],
    ),
  ];
}

// Widget card
