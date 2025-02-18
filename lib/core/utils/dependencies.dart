// Import các thư viện cần thiết

import 'package:credit_hub_app/data/repository/home/home_rep.dart';
import 'package:credit_hub_app/data/repository/home/home_rep_impl.dart';
import 'package:credit_hub_app/data/repository/sign_in/sign_in_rep.dart';
import 'package:credit_hub_app/data/repository/sign_in/sign_in_rep_impl.dart';
import 'package:credit_hub_app/data/service/home/home_service.dart';
import 'package:credit_hub_app/data/service/sign_in_api.dart';
import 'package:credit_hub_app/ui/screens/home/cubit/home_cubit.dart';
import 'package:dio/dio.dart'; // Thư viện Dio để thực hiện các yêu cầu HTTP.
import 'package:get/get.dart';

import '../../data/_base/network_manager.dart';
import '../../data/repository/otp/otp_repo.dart';
import '../../data/repository/otp/otp_repo_impl.dart';
import '../../data/repository/request/request_repo.dart';
import '../../data/repository/request/request_repo_impl.dart';
import '../../data/service/otp/otp_service.dart';
import '../../data/service/request/request_service.dart';
import '../../data/service/sign_in_service.dart';
import '../../shared/app_manager.dart';
import '../../ui/screens/otp/cubit/otp_cubit.dart';
import '../../ui/screens/request/cubit/request_cubit.dart';
import '../../ui/screens/sign_in/bloc/cubit/sign_in_cubit.dart';
import '../constant/constant.dart';

// 🔥 Import ForgotPasswordRepo
import '../../data/repository/forgot_password/forgot_password_rep.dart';
import '../../data/repository/forgot_password/forgot_password_rep_impl.dart';
import '../../data/service/forgot_password/forgot_password_service.dart';
import '../../ui/screens/forgot_password/cubit/forgot_password_cubit.dart';

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


  // ✅ Đăng ký HomeService trước khi DataRepository sử dụng nó
  if (!Get.isRegistered<HomeService>()) {
    print("📌 Đăng ký HomeService...");
    Get.lazyPut<HomeService>(
      () => HomeService(Get.find<Dio>()),
      fenix: true,
    );
  }

  // ✅ Đăng ký RequestService trước khi RequestRepo sử dụng nó
  if (!Get.isRegistered<RequestService>()) {
    print("📌 Đăng ký RequestService...");
    Get.lazyPut<RequestService>(
      () => RequestService(Get.find<Dio>()),
      fenix: true,
    );
  }

  // ✅ Đăng ký RequestRepo sau khi RequestService đã có
  if (!Get.isRegistered<RequestRepo>()) {
    print("📌 Đăng ký RequestRepo...");
    Get.lazyPut<RequestRepo>(
      () => RequestRepoImpl( requestService: Get.find()),
      fenix: true,
    );
  }


// ✅ Đăng ký RequestCubit sau khi RequestRepo đã có
if (!Get.isRegistered<RequestCubit>()) {
  print("📌 Đăng ký RequestCubit...");
  Get.lazyPut<RequestCubit>(
    () => RequestCubit(Get.find<RequestRepo>()),
    fenix: true,
  );
}

  // ✅ Đăng ký DataRepository
  if (!Get.isRegistered<DataRepository>()) {
    print("📌 Đăng ký DataRepository...");
    Get.lazyPut<DataRepository>(
      () => DataRepositoryImpl(homeService: Get.find<HomeService>()),
      fenix: true,
    );
  }

  // ✅ Đăng ký ForgotPasswordService
  if (!Get.isRegistered<ForgotPassWordService>()) {
    print("📌 Đăng ký ForgotPassWordService...");
    Get.lazyPut<ForgotPassWordService>(
      () => ForgotPassWordService(Get.find<Dio>()),
      fenix: true,
    );
  }

  // ✅ Đăng ký ForgotPasswordRepo sau khi ForgotPasswordService đã có
  if (!Get.isRegistered<ForgotPasswordRepo>()) {
    print("📌 Đăng ký ForgotPasswordRepo...");
    Get.lazyPut<ForgotPasswordRepo>(
      () => ForgotPasswordRepoImpl(Get.find<ForgotPassWordService>()),
      fenix: true,
    );
  }

   // ✅ Đăng ký OtpService
  if (!Get.isRegistered<OtpService>()) {
    Get.lazyPut<OtpService>(() => OtpService(Get.find<Dio>()), fenix: true);
  }

  // ✅ Đăng ký OtpRepository
  if (!Get.isRegistered<OtpRepository>()) {
    Get.lazyPut<OtpRepository>(() => OtpRepositoryImpl(Get.find<OtpService>()), fenix: true);
  }

  // ✅ Đăng ký OtpCubit
  if (!Get.isRegistered<OtpCubit>()) {
    Get.lazyPut<OtpCubit>(() => OtpCubit(Get.find<OtpRepository>(), email: ""), fenix: true);
  }

  // ✅ Đăng ký SignInCubit sau khi AuthRepo đã có sẵn
  if (!Get.isRegistered<SignInCubit>()) {
    print("📌 Đăng ký SignInCubit...");
    Get.lazyPut<SignInCubit>(
      () => SignInCubit(Get.find<AuthRepo>(), Get.find<AppManager>()),
      fenix: true,
    );
  }

  // ✅ Đăng ký HomeCubit (sử dụng DataRepository)
  if (!Get.isRegistered<HomeCubit>()) {
    print("📌 Đăng ký HomeCubit...");
    Get.lazyPut<HomeCubit>(
      () => HomeCubit(dataRepository: Get.find<DataRepository>()),
      fenix: true,
    );
  }

  // ✅ Đăng ký RequestCubit (sử dụng RequestRepo)
  if (!Get.isRegistered<RequestCubit>()) {
    print("📌 Đăng ký RequestCubit...");
    Get.lazyPut<RequestCubit>(
      () => RequestCubit(Get.find<RequestRepo>()),
      fenix: true,
    );
  }

  // ✅ Đăng ký ForgotPasswordCubit (sử dụng ForgotPasswordRepo)
  if (!Get.isRegistered<ForgotPasswordCubit>()) {
    print("📌 Đăng ký ForgotPasswordCubit...");
    Get.lazyPut<ForgotPasswordCubit>(
      () => ForgotPasswordCubit(Get.find<ForgotPasswordRepo>()),
      fenix: true,
    );
  }

  

  print("✅ Tất cả dependency đã được đăng ký!");
}
