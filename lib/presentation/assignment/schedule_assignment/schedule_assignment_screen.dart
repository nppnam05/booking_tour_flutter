import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:flutter/material.dart';

class ScheduleAssignmentScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phân công công các lịch trình',style: AppFonts.textWhite),
        backgroundColor: AppColors.button,
        centerTitle: true,  
        ),
      body: scheduleCard(),
    );
  }

  Widget scheduleCard(){
    return Container(
      child: Card(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [

          //Ảnh
          Padding(padding: EdgeInsets.all(15),
          child:  ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/logo_fb.png",
            //chiếm hết chiều rộng
            width: double.infinity,
            height: 200,
            // Cắt ảnh
            fit: BoxFit.cover,
            ),
          ),
          ),

          //Tetx
          Padding(padding: EdgeInsets.only(top: 5, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Chuyến đi phú quốc", style: AppFonts.text16.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),

              Row(
                children: [
                  Icon(Icons.location_on, size: 20,),
                  SizedBox(width: 5),
                  Text("Hạ Long", style: AppFonts.text16.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 5),

              Row(
                children: [
                  Text("100000", style: AppFonts.text16.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text("VNĐ", style: AppFonts.text16.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          )
          )
        ],
      ),
      )
    );
  }

}