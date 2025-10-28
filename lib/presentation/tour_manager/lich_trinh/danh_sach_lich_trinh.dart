import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/datepicker_and_time/date_picker.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/datepicker_and_time/time_picker/time_picker.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/drawer_bar/drawer_bar.dart';
import 'package:flutter/material.dart';

class Tour {
  final String imageUrl;
  final String location;
  final String description;
  final String startDate;
  final String endDate;
  final int maxCapacity;

  Tour({
    required this.imageUrl,
    required this.location,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.maxCapacity,
  });
}

class DanhSachLichTrinhScreen extends StatelessWidget {
  const DanhSachLichTrinhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Tour> tours = [
      Tour(
        imageUrl: "",
        location: "Đà Lạt",
        description: "Khám phá rừng thông và hồ Xuân Hương",
        startDate: "01/11/2025",
        endDate: "03/11/2025",
        maxCapacity: 25,
      ),
      Tour(
        imageUrl: "",
        location: "Phú Quốc",
        description: "Tham quan đảo và thưởng thức hải sản",
        startDate: "05/12/2025",
        endDate: "09/12/2025",
        maxCapacity: 40,
      ),
      Tour(
        imageUrl: "",
        location: "Hạ Long",
        description: "Du thuyền và thăm hang Sửng Sốt",
        startDate: "10/01/2026",
        endDate: "12/01/2026",
        maxCapacity: 30,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lich Trinh",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF23A892),
        centerTitle: true,
      ),
      drawer: const DrawerBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: tours.length,
                itemBuilder: (context, index) {
                  final tour = tours[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ScheduleListItem(
                      tour: tour,
                      onDelete: () {
                        print("hello");
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ElevatedButton(
              onPressed: () {
                print("hele");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF23A892),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
              ),
              child: const Text("+ Thêm"),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleListItem extends StatelessWidget {
  final Tour tour;
  final VoidCallback onDelete;

  const ScheduleListItem({
    super.key,
    required this.tour,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: const Color(0xFFE5F7F4),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildImage(),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildDate(),

                      const SizedBox(width: 6),

                      _buildIconText(
                        Icons.location_on,
                        Colors.deepOrange,
                        tour.location,
                      ),
                      const SizedBox(height: 4),

                      _buildIconText(
                        Icons.park,
                        Colors.green,
                        tour.description,
                      ),
                      const SizedBox(height: 4),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildIconText(
                            Icons.group,
                            Colors.blue,
                            "Tối đa: ${tour.maxCapacity}",
                          ),

                          _buildButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: onDelete,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
      child: const Text(
        "Xoá",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDate() {
    return Row(
      children: [
        const Icon(Icons.calendar_month, size: 18, color: Color(0xFF23A892)),
        const SizedBox(width: 4),

        Text(
          tour.startDate,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),

        const Icon(
          Icons.arrow_right_alt,
          size: 28,
          color: Color.fromARGB(255, 143, 70, 206),
        ),
        const SizedBox(width: 8),

        Text(tour.endDate, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRect(
      child: Image.network(
        tour.imageUrl.isNotEmpty
            ? tour.imageUrl
            : 'https://via.placeholder.com/100x120.png?text=No+Image',
        width: 100,
        height: 120,
        fit: BoxFit.cover,
        errorBuilder:
            (context, error, stackTrace) => Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.broken_image,
                size: 40,
                color: Colors.grey,
              ),
            ),
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    var tmp = text.split(" ");
    var limitedWords = tmp.length > 5 ? tmp.sublist(0, 5) : tmp;
    var str = limitedWords.join(" ");
    if (tmp.length > 5) str += " ...";

    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 4),
        Text(str, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
