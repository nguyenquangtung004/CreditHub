import 'package:credit_hub_app/core/constant/app_string.dart';
import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 72, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tiêu đề OTP
              Text(
                textTitleOtp,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xFFFF4A4A),
                ),
              ),
              h(8),
              // RichText hiển thị email
              RichText(
                text: TextSpan(
                  text: '$textTitleOtpDescription ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'ht.****@gmail.com',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFFFF4A4A),
                      ),
                    ),
                    const TextSpan(
                      text: '. Hãy kiểm tra và nhập xuống phía dưới.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              h(32),
              // Trường nhập mã OTP
              OtpTextField(
                numberOfFields: 4,
                borderColor: const Color(0xFFFF4A4A),
                fieldWidth: 54, // Đặt kích thước ô là 54px
                focusedBorderColor: Color(0xFFFF4A4A),
                 enabledBorderColor: Colors.grey.withOpacity(0.2),
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  // Xử lý khi thay đổi mã OTP
                },
                onSubmit: (String verificationCode) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    },
                  );
                },
              ),
              h(10),
              const Text(
                'Gửi lại mã sau 2:00 phút',
                style: TextStyle(
                  color: Color(0xFFFFB000),
                ),
              ),
              h(31),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Thực hiện hành động khi bấm nút
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Màu nền nút
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.5),
                    ),
                  ),
                  child: const Text(
                    "Xác Nhận",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
