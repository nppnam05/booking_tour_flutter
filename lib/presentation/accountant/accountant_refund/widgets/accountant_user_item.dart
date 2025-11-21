import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/formatter_helper.dart';
import 'package:flutter/material.dart';

class AccountantUserItem extends StatelessWidget {
  const AccountantUserItem({super.key});

  @override
  Widget build(BuildContext context) {
    var imageLink =
        "https://cdn.nhandan.vn/images/1ef398c4e2fb4bf07980a2ded785b3ef6da51f0c0ad991901283c66f347bc9e4685e90a6d43591956557c1247283a022cf57c2a816edb3be3cd0e904b555bd11/halongbay-3501.jpg";
    String name = "Nguyễn Văn A";
    String bank = "Vietcombank";
    String chiNhanh = "Chí nhánh: Hồ Chí Minh";
    String cardNum = "042839284";
    int money = 8000000;
    String email = "nguyenvana@gmail.com";
    String phone = "03849283829";
    int numOfPersons = 4;

    return Container(
      padding: EdgeInsets.all(5),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: Image.network(imageLink, fit: BoxFit.fill),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(name, style: Theme.of(context).textTheme.headlineMedium),
                  Text("Email: $email"),
                  Text("Số điện thoại: $phone"),
                  Text("STK: $cardNum"),
                  Text("Ngân hàng: $bank"),
                  Text("Số tiền: ${FormatterHelper.formatCurrency(money)}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
