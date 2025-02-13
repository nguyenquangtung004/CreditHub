import 'package:credit_hub_app/core/constant/app_string.dart';
import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:credit_hub_app/shared/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/detail/detail_request.dart';


class CustomItemHistory extends StatelessWidget {
  final int id; // ✅ Thêm requestId (id)
  final String textstatus;
  final String lotNumber;
  final String dateRequest;
  final String lotPrice;
  final Gradient gradientColor;
  final String imageBill;

  const CustomItemHistory({
    super.key,
    required this.id, // ✅ Nhận requestId từ danh sách
    required this.textstatus,
    required this.lotNumber,
    required this.dateRequest,
    required this.lotPrice,
    required this.gradientColor,
    required this.imageBill,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Navigating to: ${AppRoute.requestDetails.route} with ID: $id");
          Get.to(() => DetailRequestScreen(requestId: id)); 
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 7.0),
        width: double.infinity,
        height: 111,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFE2E2E2),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        gradient: gradientColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          textstatus,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Ngày yêu cầu", // ✅ Tên cố định thay vì biến
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFF717E95),
                      ),
                    ),
                    const SizedBox(height: 11),
                    const Text(
                      "Số tiền",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF717E95),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 13),
                    Text(
                      lotNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      dateRequest,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF7C7C7C),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      lotPrice,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
