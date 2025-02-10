import 'package:credit_hub_app/data/repository/home/home_rep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'core/constant/constant.dart';
import 'core/utils/dependencies.dart';
import 'data/_base/network_manager.dart';
import 'data/repository/forgot_password/forgot_password_rep.dart';
import 'data/repository/forgot_password/forgot_password_rep_impl.dart';
import 'data/repository/home/home_rep_impl.dart';
import 'data/repository/otp/otp_repo.dart';
import 'data/repository/otp/otp_repo_impl.dart';
import 'data/service/forgot_password/forgot_password_service.dart';
import 'data/service/home/home_service.dart';
import 'data/service/otp/otp_service.dart';
import 'shared/app_manager.dart';
import 'shared/app_route.dart';
import 'ui/screens/forgot_password/cubit/forgot_password_cubit.dart';
import 'ui/screens/home/cubit/home_cubit.dart';
import 'ui/screens/otp/cubit/otp_cubit.dart';
import 'ui/screens/sign_in/sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // ✅ Tải biến môi trường từ .env
    await dotenv.load(fileName: ".env");
    print("📌 .env đã tải thành công!");
  } catch (e) {
    print("❌ Lỗi khi tải .env: $e");
  }

  // ✅ Cung cấp các dependencies (cấu hình GetX)
  provideDependencies();
  final GlobalManager _globalManager = Get.find();

  // ✅ Khởi tạo Dio
  final dio = NetworkManager().createDio().addInterceptors();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppManager>(
          create: (context) => AppManager(), // ✅ Thêm AppManager vào Provider
        ),
        RepositoryProvider<HomeService>(
          create: (context) => HomeService(dio),
        ),
        RepositoryProvider<ForgotPassWordService>(
          create: (context) => ForgotPassWordService(dio),
        ),
        RepositoryProvider<OtpService>(
          create: (context) => OtpService(dio),
        ),
        RepositoryProvider<DataRepository>(
          create: (context) => DataRepositoryImpl(
            homeService: context.read<HomeService>(),
          ),
        ),
        RepositoryProvider<ForgotPasswordRepo>(
          create: (context) => ForgotPasswordRepoImpl(
            context.read<ForgotPassWordService>(),
          ),
        ),
        RepositoryProvider<OtpRepository>(
          create: (context) => OtpRepositoryImpl(
            context.read<OtpService>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(
              dataRepository: context.read<DataRepository>(),
            )..fetchHomeData(),
          ),
          BlocProvider<ForgotPasswordCubit>(
            create: (context) => ForgotPasswordCubit(
              context.read<ForgotPasswordRepo>(),
            ),
          ),
          BlocProvider<OtpCubit>(
            create: (context) => OtpCubit(
              context.read<OtpRepository>(),
            ),
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
