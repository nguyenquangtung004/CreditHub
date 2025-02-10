import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/button/app_button.dart';
import '../../../core/components/text_field/app_text_field.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/constant/constant.dart';
import '../../../shared/app_route.dart';
import '../../../data/repository/forgot_password/forgot_password_rep.dart';
import 'cubit/forgot_password_cubit.dart';
import 'cubit/forgot_password_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(context.read<ForgotPasswordRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordSuccess) {
                print("✅ Yêu cầu đặt lại mật khẩu thành công!");
                Get.toNamed(AppRoute.enterOtp.name);
              } else if (state is ForgotPasswordError) {
                print("❌ Lỗi: ${state.message}");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
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
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Email không được để trống")),
                                  );
                                  return;
                                }
                                context.read<ForgotPasswordCubit>().sendForgotPasswordRequest(email);
                              },
                        height: 48,
                        background: Color(0xFFFF4A4A),
                      ),
                      h(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back, color: Colors.red),
                                w(8),
                                const Text(
                                  returnSignIn,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
