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

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String email =
        Get.arguments ?? "Email không xác định"; // ✅ Lấy email từ Get.arguments
    log('Lấy từ email argument:$email');
    return BlocProvider(
      create: (context) =>
          OtpCubit(context.read<OtpRepository>(), email: email),
      child: Scaffold(
        body: BlocConsumer<OtpCubit, OtpState>(
          listener: (context, state) {
            if (state is OtpSuccess) {
              Get.snackbar("Thành công", "Đã xác minh otp thành công");
            } else if (state is OtpError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("❌ ${state.message}")),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
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
                      fieldWidth: 54,
                      focusedBorderColor: Color(0xFFFF4A4A),
                      enabledBorderColor: Colors.grey.withOpacity(0.2),
                      showFieldAsBox: true,
                      onSubmit: (String verificationCode) {
                        context.read<OtpCubit>().verifyOtp(verificationCode);
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
                        onPressed: state is OtpLoading
                            ? null
                            : () {
                                // Lấy OTP từ ô nhập liệu
                                context
                                    .read<OtpCubit>()
                                    .verifyOtp("1234"); // Giả sử nhập OTP
                              },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.5),
                          ),
                        ),
                        child: state is OtpLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : const Text(
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
            );
          },
        ),
      ),
    );
  }
}
