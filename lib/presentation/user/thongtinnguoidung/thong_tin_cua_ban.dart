import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/delete_button_widget.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_icon_toggle_input_field.dart';
import 'package:booking_tour_flutter/presentation/widgets/textfield_not_tilte.dart';
import 'package:flutter/material.dart';

class ThongTinCuaBanScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin của bạn", style: AppFonts.textWhite),
      ),
      body: Expanded(
        child: Column(
          children: [
            SizedBox(height: 20),
            _buidInformation(),

            SizedBox(height: 20),
            _buildTextFeild(context, controller),

            SizedBox(height: 50),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDialog(BuildContext context, String label,String value, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cập nhật", style: AppFonts.text16),

          SizedBox(height: 10),
          notIconToggleInputField(controller,label, value, AppColors.gray),

          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Xác nhận
              DeleteButtonWidget(
                onDelete: () {
                  print("heh");
                },
                text: "Xác nhận",
                textColor: Colors.white,
                backgroundColor: AppColors.borderButton,
              ),
              SizedBox(width: 10),
              //huỷ
              DeleteButtonWidget(
                onDelete: () {
                  Navigator.pop(context);
                },
                text: "Huỷ",
                textColor: Colors.white,
                backgroundColor: AppColors.delete,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buidInformation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset("assets/images/close.png", fit: BoxFit.cover),
          ),
        ),

        Text("Trần Trọng Tình", style: AppFonts.text18),
        Text("test@gmail.com", style: AppFonts.text14),
      ],
    );
  }

  Widget _buildTextFeild(
    BuildContext context,
    TextEditingController controller,
  ) {
    return Padding(
      padding: EdgeInsetsGeometry.all(15),
      child: Column(
        children: [
          TextfieldNotTilte(
            label: "Tên",
            value: "Tinh",
            icon: Icons.edit,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: const EdgeInsets.all(20),
                    child: _buildDialog(context,"Tên", "Tinh", controller),
                  );
                },
              );
            },
          ),

          SizedBox(height: 10),
          TextfieldNotTilte(
            label: "SDT",
            value: "0123456789",
            icon: Icons.edit,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: const EdgeInsets.all(20),
                    child: _buildDialog(context,"SDT","0123456789", controller),
                  );
                },
              );
              
            },
          ),

          SizedBox(height: 10),
          TextfieldNotTilte(
            label: "Email",
            value: "test@gmail.com",
            icon: Icons.edit,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: const EdgeInsets.all(20),
                    child: _buildDialog(context,"Email","test@gmail.com", controller),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext content) {
    return DeleteButtonWidget(
      onDelete: () {
        print("hehe");
      },
      text: "Đổi mật khẩu",
      textColor: Colors.white,
      backgroundColor: AppColors.button,
    );
  }
}
