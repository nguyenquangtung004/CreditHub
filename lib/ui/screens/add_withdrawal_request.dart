import 'package:credit_hub_app/ui/widgets/add_width_drawal_request/custom_rich_text.dart';
import 'package:credit_hub_app/ui/widgets/add_width_drawal_request/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../core/constant/app_string.dart';
import '../../core/constant/constant.dart';
import '../widgets/add_width_drawal_request/custom_dotted_border_box.dart';

class AddWithDrawalRequestScreen extends StatelessWidget {
  const AddWithDrawalRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        centerTitle: true,
        title: const Text(
          textAddWithdrawal,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              h(20),
              const Row(
                children: [
                  CustomRichText(
                      textTitle: richTextTitleLot, textTitle01: richTextTitle01)
                ],
              ),
              h(10),
              const CustomTextField(
                hintText: textHintLot,
              ),
              h(22),
              const Row(
                children: [
                  CustomRichText(
                      textTitle: richTextTitlePrice,
                      textTitle01: richTextTitle01)
                ],
              ),
              h(10),
              const CustomTextField(
                hintText: textHintPrice,
              ),
              h(22),
              const Row(
                children: [
                  CustomRichText(
                      textTitle: richTextImage, textTitle01: richTextTitle01)
                ],
              ),
              h(22),
              GestureDetector(
                  onTap: () {
                    print("Tải hình ảnh hóa đơn");
                  },
                  child: DottedBorderBox()),
              h(48),
              SizedBox(
                width: double.infinity,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {
                    // Thực hiện hành động khi bấm nút
                    print("Xem lý do không quyết toán");
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
                    "Gửi Yêu Cầu",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
