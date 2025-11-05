import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/domain/bank.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/delete_button_widget.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_icon_toggle_input_field.dart';
import 'package:booking_tour_flutter/presentation/widgets/textfield_not_tilte.dart';
import 'package:booking_tour_flutter/presentation/widgets_dialog/generic_selected_dialog.dart';
import 'package:flutter/material.dart';

class ViScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  Bank? selectedBank;
  ValueChanged<Bank?> onChanged =(value) {
  };
  
  final List<Bank> banks = [
  Bank(id: 1, name: 'Vietcombank'),
  Bank(id: 2, name: 'Techcombank'),
  Bank(id: 3, name: 'BIDV'),
  Bank(id: 4, name: 'ACB'),
  Bank(id: 5, name: 'VPBank'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ví", style: AppFonts.textWhite,),),
      body: Expanded(child: 
      Column(
        children: [
          SizedBox(height: 20),
          _buidInformation(),

          SizedBox(height: 20),
          Padding(padding: EdgeInsets.only(left: 15, right: 15),
          child: Text("Lưu ý: số tiền này của bạn sẽ được trừ vào lần sau nếu như bạn đặt và sẽ được giảm giá 5% số tiền của chuyến đi đó",
          style: TextStyle(color: Colors.blue),),),

          _buildTextFeild(context, controller),

          SizedBox(height: 50),
          _buildButton(context,banks, selectedBank, onChanged),
        ],
      )
      ),
    );
  }

  Widget _buildNganHang(
    BuildContext context,
    List<Bank> danhSachNganHang,
    Bank? selectedBank,
    ValueChanged<Bank?> onChanged,
  ) {
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: InkWell(
        onTap: () async {
          final Bank? result = await showDialog(
            context: context,
            builder:
                (_) => SelectionDialog<Bank>(
                  title: "Tên ngân hàng",
                  items: danhSachNganHang,
                  display: (p) => p.name,
                  isMultiSelect: false,
                  preSelectedItems:
                      selectedBank != null ? [selectedBank] : [],
                ),
          );
          if (result != null) {
            onChanged(result);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.secondary),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedBank?.name ?? "Chọn ngân hàng",
                style: AppFonts.text16,
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

   Widget _buildDialog(BuildContext context, TextEditingController controller,List<Bank> danhSachNganHang,Bank? selectedBank,ValueChanged<Bank?> onChanged) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Điền thông tin tài khoản", style: AppFonts.text20),
            SizedBox(height: 10),
            _buildNganHang(context,danhSachNganHang,selectedBank,onChanged),
      
            SizedBox(height: 10),
            notIconToggleInputField(controller,"Chi nhánh ngân hàng", "Điền chi nhánh ngân hàng", AppColors.gray),
            SizedBox(height: 10),
            notIconToggleInputField(controller,"Số tài khoản ngân hàng", "Điền số tài khoản ngân hàng", AppColors.gray),
      
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
      ),
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
            label: "Số tiền còn dư",
            value: "1000000 vnd",
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

  Widget _buildButton(BuildContext context,
    List<Bank> danhSachNganHang,
    Bank? selectedBank,
    ValueChanged<Bank?> onChanged) {
    return DeleteButtonWidget(
      onDelete: () {
        showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: const EdgeInsets.all(20),
                    child: _buildDialog(context, controller,danhSachNganHang,selectedBank,onChanged),
                  );
                },
              );
      },
      text: "Yêu cầu nhận lại tiền",
      textColor: Colors.white,
      backgroundColor: AppColors.button,
    );
  }
}