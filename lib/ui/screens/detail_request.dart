import 'package:credit_hub_app/core/constant/app_string.dart';
import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:credit_hub_app/shared/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/detail_request/custom_card_detail.dart';
import '../widgets/detail_request/custom_time_line.dart';

class DetailRequestScreen extends StatelessWidget {
  final String textstatus;
  final String lotNumber;
  final String dateRequest;
  final String lotPrice;
  final String imageBill;

  const DetailRequestScreen({
    super.key,
    required this.textstatus,
    required this.lotNumber,
    required this.dateRequest,
    required this.lotPrice,
    required this.imageBill,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            titleRequest,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCardDetailBill(
                    textstatus: textstatus,
                    lotNumber: lotNumber,
                    dateRequest: dateRequest,
                    lotPrice: lotPrice),
                // h(10),
                Text(
                  titleDetailRequest,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                h(10),
                Container(
                  width: double.infinity,
                  height: 312,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(imageBill),
                  ),
                ),
                h(20),
                CustomTimeline(
                  textstatus: textstatus,
                ),
                h(13),
                 if (textstatus == "Không quyết toán")
                  Center(
                    child: Container(
                      width: 270,
                      height: 65,
                      child:  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.addWithdrawalRequest.name);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFF4A4A), // Màu nền nút
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.5),
                      ),
                    ),
                    child: const Text(
                      "Yêu cầu lại",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                                    ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
