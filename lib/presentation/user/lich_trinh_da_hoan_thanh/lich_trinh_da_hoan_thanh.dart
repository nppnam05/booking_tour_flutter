import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:flutter/material.dart';

class LichTrinhDaHoanThanhScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lịch trình đã hoàn thành")),
      body: _buildCardSchedule(),
    );
  }

  Widget _buildCardSchedule() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/logo_fb.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
        
            SizedBox(height: 10,),
            Row(
              children: [
                Text("<>  ",style: AppFonts.text20,),
                Text("Mã lịch trình: ",style: AppFonts.text20),
                Text("ABCD",style: AppFonts.text20)
              ],
            ),

            SizedBox(height: 5,),
            Text("Chuyến đi phú quốc",style: AppFonts.text20,),

            SizedBox(height: 5,),
            Row(
              children: [
                Icon(Icons.location_city, size: 20,),
                Text(" Hạ Long",style: AppFonts.text20,)
              ],
            ),

            SizedBox(height: 5,),
            Row(
              children: [
                Text("500000",style: AppFonts.text20,),
                Text("  VNĐ",style: AppFonts.text20,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
