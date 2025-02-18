import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/constant/constant.dart';
import '../../../data/repository/otp/otp_repo.dart';
import 'cubit/otp_cubit.dart';
import 'cubit/otp_state.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String email;

  /// ✅ Lấy OtpCubit từ GetX
  OtpCubit get _cubit => Get.find<OtpCubit>();

  @override
  void initState() {
    super.initState();
    email = Get.arguments ?? "Email không xác định"; // ✅ Lấy email từ Get.arguments
    log("📌 Nhận email từ tham số: $email");

    try {
      if (!Get.isRegistered<OtpCubit>()) {
        log("📌 Đăng ký OtpCubit...");
        Get.put(OtpCubit(Get.find<OtpRepository>(), email: email));
      }
    } catch (e) {
      log("❌ Lỗi khi đăng ký OtpCubit: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OtpCubit, OtpState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is OtpSuccess) {
            Get.snackbar("Thành công", "Đã xác minh otp thành công");
          } else if (state is OtpError) {
            Get.snackbar("Lỗi", state.message, backgroundColor: Colors.red);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 72, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tiêu đề OTP
              const Text(
                textTitleOtp,
                style: TextStyle(
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
                      text: email,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFFFF4A4A),
                      ),
                    ),
                    const TextSpan(
                      text: '. Hãy kiểm tra và nhập mã phía dưới.',
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
                fieldWidth: 54,
                focusedBorderColor: Color(0xFFFF4A4A),
                enabledBorderColor: Colors.grey.withOpacity(0.2),
                showFieldAsBox: true,
                onSubmit: (String verificationCode) {
                  _cubit.verifyOtp(verificationCode);
                },
              ),
              h(10),
              const Text(
                'Gửi lại mã sau 2:00 phút',
                style: TextStyle(color: Color(0xFFFFB000)),
              ),
              h(31),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _cubit.verifyOtp; // Giả sử nhập OTP
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
