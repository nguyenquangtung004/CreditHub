import 'package:credit_hub_app/core/constant/app_string.dart';
import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:credit_hub_app/shared/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomItemHome extends StatelessWidget {
  final String textstatus;
  final String lotNumber;
  final String dateRequest;
  final String lotPrice;
  final Gradient gradientColor;
  const CustomItemHome(
      {super.key,
      required this.textstatus,
      required this.lotNumber,
      required this.dateRequest,
      required this.lotPrice, 
      required this.gradientColor, 
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("Navigating to: ${AppRoute.requestDetails.route}");
        // Get.toNamed(AppRoute.requestDetails.name,arguments: {
        //   "textstatus": textstatus,
        //   "lotNumber": lotNumber,
        //   "dateRequest": dateRequest,
        //   "lotPrice": lotPrice,
        // });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 7.0 ),
        width: double.infinity,
        height: 111,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFE2E2E2),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h(10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          gradient: gradientColor),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          textstatus,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700,fontSize: 12),
                        ),
                      ),
                    ),
                    h(8),
                    Text(
                      dateRequestTittle,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFF717E95)),
                    ),
                    h(11),
                    Text(
                      richTextTitlePrice,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF717E95),
                        fontSize: 12,
                      ),
                    ),
                    h(10)
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
                    h(13),
                    Text(
                      lotNumber,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black),
                    ),
                    h(10),
                    Text(
                      dateRequest,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF7C7C7C),
                      ),
                    ),
                    h(10),
                    Text(
                      lotPrice,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.red),
                    ),
                    h(12)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
