import 'package:credit_hub_app/data/repository/home/home_rep.dart'; // Nhập interface DataRepository cho Home
import 'package:flutter/material.dart'; // Nhập thư viện Material Design của Flutter
import 'package:flutter_bloc/flutter_bloc.dart'; // Nhập thư viện flutter_bloc để quản lý trạng thái
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Nhập thư viện flutter_dotenv để đọc biến môi trường từ .env
import 'package:get/get.dart'; // Nhập thư viện GetX cho dependency injection và các tiện ích khác

import 'core/constant/constant.dart'; // Nhập file constant.dart chứa các hằng số
import 'core/utils/dependencies.dart'; // Nhập file dependencies.dart để cấu hình dependency injection
import 'data/_base/network_manager.dart'; // Nhập NetworkManager để quản lý network requests
import 'data/repository/forgot_password/forgot_password_rep.dart'; // Nhập interface ForgotPasswordRepo
import 'data/repository/forgot_password/forgot_password_rep_impl.dart'; // Nhập implementation ForgotPasswordRepoImpl
import 'data/repository/home/home_rep_impl.dart'; // Nhập implementation DataRepositoryImpl cho Home
import 'data/repository/otp/otp_repo.dart'; // Nhập interface OtpRepository
import 'data/repository/otp/otp_repo_impl.dart'; // Nhập implementation OtpRepositoryImpl
import 'data/service/forgot_password/forgot_password_service.dart'; // Nhập service ForgotPassWordService
import 'data/service/home/home_service.dart'; // Nhập service HomeService
import 'data/service/otp/otp_service.dart'; // Nhập service OtpService
import 'shared/app_manager.dart'; // Nhập AppManager để quản lý các thông tin toàn cục của ứng dụng
import 'shared/app_route.dart'; // Nhập AppRoute để quản lý routing của ứng dụng
import 'ui/screens/forgot_password/cubit/forgot_password_cubit.dart'; // Nhập Cubit ForgotPasswordCubit
import 'ui/screens/home/cubit/home_cubit.dart'; // Nhập Cubit HomeCubit
import 'ui/screens/otp/cubit/otp_cubit.dart'; // Nhập Cubit OtpCubit
import 'ui/screens/request/cubit/request_cubit.dart';
import 'ui/screens/sign_in/sign_in.dart'; // Nhập màn hình SignInScreen

// 🔥 THÊM CÁC IMPORT LIÊN QUAN ĐẾN `RequestCubit`
import 'data/repository/request/request_repo.dart'; 
import 'data/repository/request/request_repo_impl.dart';
import 'data/service/request/request_service.dart';

/// 📌 **Hàm main - Điểm khởi chạy ứng dụng**
Future<void> main() async {
  // ✅ Khởi tạo Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // ✅ Tải biến môi trường từ file .env
    await dotenv.load(fileName: ".env");
    print("📌 .env đã tải thành công!");
  } catch (e) {
    print("❌ Lỗi khi tải .env: $e");
  }

  // ✅ Cấu hình Dependency Injection (DI) với GetX
  provideDependencies();
  final GlobalManager _globalManager = Get.find();

  // ✅ Khởi tạo Dio (HTTP client)
  final dio = NetworkManager().createDio().addInterceptors();

  // 🔥 Chạy ứng dụng
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppManager>(create: (context) => AppManager()),

        /// ✅ **Cấu hình Service**
        RepositoryProvider<HomeService>(create: (context) => HomeService(dio)),
        RepositoryProvider<ForgotPassWordService>(create: (context) => ForgotPassWordService(dio)),
        RepositoryProvider<OtpService>(create: (context) => OtpService(dio)),
        RepositoryProvider<RequestService>(create: (context) => RequestService(dio)), // 🔥 Thêm RequestService

        /// ✅ **Cấu hình Repository**
        RepositoryProvider<DataRepository>(
          create: (context) => DataRepositoryImpl(homeService: context.read<HomeService>()),
        ),
        RepositoryProvider<ForgotPasswordRepo>(
          create: (context) => ForgotPasswordRepoImpl(context.read<ForgotPassWordService>()),
        ),
        RepositoryProvider<OtpRepository>(
          create: (context) => OtpRepositoryImpl(context.read<OtpService>()),
        ),
        RepositoryProvider<RequestRepo>(
          create: (context) => RequestRepoImpl(requestService: context.read<RequestService>()), // 🔥 Thêm RequestRepo
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          /// ✅ **Cấu hình Cubit**
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(dataRepository: context.read<DataRepository>())..fetchHomeData(),
          ),
          BlocProvider<ForgotPasswordCubit>(
            create: (context) => ForgotPasswordCubit(context.read<ForgotPasswordRepo>()),
          ),
          BlocProvider<OtpCubit>(
            create: (context) => OtpCubit(context.read<OtpRepository>()),
          ),
          BlocProvider<RequestCubit>(
            create: (context) => RequestCubit(context.read<RequestRepo>()), // 🔥 Thêm RequestCubit
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignInScreen(),
          navigatorKey: _globalManager.navigatorKey,
          initialRoute: AppRoute.signIn.name,
          onGenerateRoute: AppRouteExt.generateRoute,
        ),
      ),
    ),
  );
}
