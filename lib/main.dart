import 'package:flutter/material.dart'; // Thư viện UI chính của Flutter
import 'package:flutter/services.dart'; // Quản lý hệ thống
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Đọc biến môi trường
import 'package:get/get.dart'; // Quản lý trạng thái & điều hướng
import 'package:credit_hub_app/core/constant/constant.dart'; // Hằng số
import 'package:credit_hub_app/shared/app_route.dart'; // Định nghĩa route
import 'package:credit_hub_app/core/utils/dependencies.dart'; // Inject dependencies
import 'package:credit_hub_app/theme/custom_theme.dart'; // Theme tùy chỉnh
import 'package:credit_hub_app/theme/app_theme.dart'; // App theme chính

Future<void> main() async {
  // ✅ Đảm bảo Flutter binding đã được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Load biến môi trường từ file .env
  await dotenv.load(fileName: ".env");

  // ✅ Inject tất cả dependencies (DI)
  provideDependencies();

  // ✅ Chạy ứng dụng Flutter
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // ✅ Lấy một instance của GlobalManager để quản lý navigation
  final GlobalManager _globalManager = Get.find();

  @override
  Widget build(BuildContext context) {
    // ✅ Thiết lập hướng màn hình chỉ hỗ trợ dọc
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // ✅ GestureDetector giúp ẩn bàn phím khi chạm ra ngoài TextField
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,

      // ✅ Widget gốc của ứng dụng sử dụng GetX
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _globalManager.navigatorKey, // Sử dụng navigatorKey từ GlobalManager
        theme: CustomTheme.fromContext(context).oneAppTheme, // Cấu hình theme từ CustomTheme
        initialRoute: AppRoute.signIn.name, // Route khởi đầu (màn hình SignIn)

        // ✅ Builder để bọc theme toàn bộ ứng dụng
        builder: (context, child) {
          return AppTheme(child: child!);
        },

        // ✅ Xử lý điều hướng dựa trên RouteSettings
        onGenerateRoute: AppRouteExt.generateRoute,
      ),
    );
  }
}
