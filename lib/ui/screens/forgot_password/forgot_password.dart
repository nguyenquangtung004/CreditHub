import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/button/app_button.dart';
import '../../../core/components/text_field/app_text_field.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/constant/constant.dart';
import '../../../shared/app_route.dart';
import 'cubit/forgot_password_cubit.dart';
import 'cubit/forgot_password_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  ForgotPasswordCubit get _cubit => Get.find<ForgotPasswordCubit>(); // ✅ Lấy instance của ForgotPasswordCubit từ GetX
  @override
  void initState() {
    super.initState();
   try {
    if (!Get.isRegistered<ForgotPasswordCubit>()) {
      log("📌 Đăng ký ForgotPasswordCubit...");
      Get.put(ForgotPasswordCubit(Get.find()));
    }
  } catch (e) {
    log("❌ Lỗi khi đăng ký ForgotPasswordCubit: $e");
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state is ForgotPasswordSuccess) {
              final email = emailController.text.trim();
              log("✅ Yêu cầu đặt lại mật khẩu thành công!");
              Get.toNamed(AppRoute.enterOtp.name, arguments: email);
            } else if (state is ForgotPasswordError) {
              log("❌ Lỗi: ${state.message}");
              Get.snackbar("Lỗi", state.message, backgroundColor: Colors.red);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  h(50),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        forgotPassword,
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                      ),
                    ],
                  ),
                  h(8),
                  const Text(
                    forgotPasswordDescription,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  h(32),
                  CustomTextField(
                    label: 'Email',
                    controller: emailController,
                  ),
                  h(24),
                  AppButton(
                    label: state is ForgotPasswordLoading ? "Đang gửi..." : "Gửi",
                    onPressed: state is ForgotPasswordLoading
                        ? null
                        : () {
                            final email = emailController.text.trim();
                            if (email.isEmpty) {
                              Get.snackbar("Lỗi", "Email không được để trống", backgroundColor: Colors.red);
                              return;
                            }
                            log("📌 Gửi yêu cầu quên mật khẩu với email: $email");
                            _cubit.sendForgotPasswordRequest(email);
                          },
                    height: 48,
                    background: const Color(0xFFFF4A4A),
                  ),
                  h(24),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.arrow_back, color: Colors.red),
                        w(8),
                        const Text(
                          returnSignIn,
                          style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
