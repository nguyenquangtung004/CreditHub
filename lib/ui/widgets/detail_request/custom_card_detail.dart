import 'package:credit_hub_app/core/constant/app_string.dart';
import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';

class CustomCardDetailBill extends StatelessWidget {
  final String textstatus;
  final String lotNumber;
  final String dateRequest;
  final String lotPrice;
  final String? textReson;
  const CustomCardDetailBill({
    super.key,
    required this.textstatus,
    required this.lotNumber,
    required this.dateRequest,
    required this.lotPrice,
    this.textReson,
  });

  @override
  Widget build(BuildContext context) {
    // Lấy gradient từ statusGradients hoặc dùng màu xám nếu không có
    final LinearGradient gradientColor = statusGradients[textstatus] ??
        LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.grey, Colors.grey.shade700],
        );
    return GestureDetector(
      onTap: () {
        print("Xem Chi Tiết");
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5.0),
        width: double.infinity,
        height: 131,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      gradient:gradientColor),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      textstatus,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Text(
                  lotNumber,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.black),
                ),
              ],
            ),
            h(10),
            //NOTE:ROW2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateRequestTittle,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF717E95)),
                ),
                Text(
                  dateRequest,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF7C7C7C),
                  ),
                ),
              ],
            ),
            h(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  richTextTitlePrice,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF717E95),
                    fontSize: 12,
                  ),
                ),
                Text(
                  lotPrice,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.red),
                ),
              ],
            ),
            h(10),
            if(textstatus == 'Không quyết toán')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lý do: Thông tin và hình ảnh không khớp",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
