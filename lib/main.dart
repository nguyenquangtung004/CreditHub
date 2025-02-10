import 'package:credit_hub_app/shared/app_route.dart';
import 'package:credit_hub_app/ui/screens/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constant/constant.dart';
import 'core/utils/dependencies.dart';
import 'data/_base/network_manager.dart';
import 'data/repository/home/home_rep_impl.dart';
import 'data/service/home/home_service.dart';
import 'ui/screens/home/cubit/home_cubit.dart';

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

  // ✅ Khởi tạo Dio & Repository
  final dio = NetworkManager().createDio().addInterceptors();
  final homeService = HomeService(dio);
  final dataRepository = DataRepositoryImpl(homeService: homeService);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(dataRepository: dataRepository)..fetchHomeData(),
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
  );
}
