import 'package:credit_hub_app/core/button/app_button.dart';
import 'package:credit_hub_app/data/repository/sign_in/sign_in_rep.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:credit_hub_app/core/components/text_field/app_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/components/dialog/app_dialog.dart';
import '../../../core/components/loading/app_loading.dart';
import '../../../core/constant/app_string.dart';
// import '../../../data/model/auth/user/user.dart';
import '../../../data/service/sign_in_api.dart';
import '../../../data/service/sign_in_service.dart';
import '../../../shared/app_manager.dart';
import '../../../shared/app_route.dart';
import '../../../data/repository/sign_in/sign_in_rep_impl.dart';
import 'bloc/cubit/sign_in_cubit.dart';
import 'bloc/cubit/sign_in_state.dart'; 
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  SignInCubit get _cubit =>
      Get.find<SignInCubit>(); // Lấy instance của SignInCubit từ GetX
  AppManager get _appManager =>
      Get.find<AppManager>(); // Lấy instance của AppManager từ GetX
  String userName = ''; // Tên người dùng (nếu đã đăng nhập trước đó)
  // UserModel? _userModel; // Thông tin người dùng (nếu đã đăng nhập trước đó)
  // ✅ Đảm bảo SignInCubit được khởi tạo trước khi sử dụng Get.find()
  @override
  void initState() {
    super.initState();
    try {
      if (!Get.isRegistered<AuthRepo>()) {
        print("📌 Đăng ký AuthRepo...");
        Get.put<AuthRepo>(AuthRepositoryImpl(
          repo: SignInServiceApi(service: SignInService(Get.find<Dio>())),
        ));
      }

      if (!Get.isRegistered<SignInCubit>()) {
        print("📌 Đăng ký SignInCubit...");
        Get.put(SignInCubit(Get.find<AuthRepo>(), Get.find<AppManager>()));
      }
    } catch (e, stacktrace) {
      print("❌ Lỗi trong initState(): $e");
      print(stacktrace);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<SignInCubit, SignInState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state.status == SignInStatus.loading) {
            AppLoading.show(); // Hiển thị loading indicator
            return;
          }

          AppLoading.dismiss(); // Ẩn loading indicator

          if (state.status == SignInStatus.success) {
            Get.offAllNamed(AppRoute.main.name); // Chuyển đến màn hình chính
            return;
          }

          if (state.status == SignInStatus.failure) {
            AppDialog.show(context, msg: state.message); // Hiển thị lỗi
            return;
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  h(50),
                  const Text(
                    signInTitle,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                  h(70),
                  CustomTextField(
                    label: loginName,
                    controller: usernameController,
                  ),
                  h(24),
                  CustomTextField(
                    label: password,
                    isPassword: true,
                    controller: passwordController,
                  ),
                  h(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () =>
                            Get.toNamed(AppRoute.forgotPassword.name),
                        child: const Text(
                          forgotPassword,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  h(12),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      background: Color(0xFFFF4A4A),
                      label: signInTitle,
                      onPressed: _cubit.state.status == SignInStatus.loading
                          ? () {} // Vô hiệu hóa khi loading
                          : () {
                              _cubit.signIn(
                                username: usernameController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            },
                    ),
                  ),
                  h(27),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          imagesLogo,
                          height: 200,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
