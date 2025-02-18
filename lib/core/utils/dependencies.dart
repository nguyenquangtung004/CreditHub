// Import các thư viện cần thiết

import 'package:credit_hub_app/data/repository/sign_in/sign_in_rep.dart';
import 'package:credit_hub_app/data/repository/sign_in/sign_in_rep_impl.dart';
import 'package:credit_hub_app/data/service/sign_in_api.dart';
import 'package:dio/dio.dart'; // Thư viện Dio để thực hiện các yêu cầu HTTP.
import 'package:get/get.dart';

import '../../data/_base/network_manager.dart';
import '../../data/service/sign_in_service.dart';
import '../../shared/app_manager.dart';
import '../../ui/screens/sign_in/bloc/cubit/sign_in_cubit.dart';
import '../constant/constant.dart';

// Hàm `provideDependencies` được sử dụng để đăng ký các dependency vào GetX.
void provideDependencies() {
  print("📌 Bắt đầu đăng ký dependency...");

  // ✅ Đăng ký AppManager trước
  Get.put(AppManager());

  // ✅ Đăng ký NetworkManager
  Get.put(NetworkManager());

  // ✅ Đăng ký Dio sau khi có NetworkManager
  if (!Get.isRegistered<Dio>()) {
    print("📌 Đăng ký Dio...");
    Get.lazyPut<Dio>(
      () => Get.find<NetworkManager>().createDio()..addInterceptors(),
      fenix: true,
    );
  }
   // NOTE: Đăng ký GlobalManager như một singleton
  Get.lazyPut(() => GlobalManager(), fenix: true);

  // ✅ Đăng ký AuthRepositoryImpl
  if (!Get.isRegistered<AuthRepo>()) {
    print("📌 Đăng ký AuthRepository...");
    Get.lazyPut<AuthRepo>(
      () => AuthRepositoryImpl(
        repo: SignInServiceApi(
          service: SignInService(Get.find<Dio>()),
        ),
      ),
      fenix: true,
    );
  }

  // ✅ Đăng ký SignInCubit sau khi AuthRepo đã có sẵn
  if (!Get.isRegistered<SignInCubit>()) {
    print("📌 Đăng ký SignInCubit...");
    Get.lazyPut<SignInCubit>(
      () => SignInCubit(Get.find<AuthRepo>(), Get.find<AppManager>()),
      fenix: true,
    );
  }


  print("✅ Tất cả dependency đã được đăng ký!");
}
