import 'package:credit_hub_app/shared/app_route.dart';
import 'package:credit_hub_app/ui/screens/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'core/constant/constant.dart';
import 'core/utils/dependencies.dart';

Future <void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   
  try {
    // ✅ Tải biến môi trường từ .env
    await dotenv.load(fileName: ".env");
    print("📌 .env đã tải thành công!");
  } catch (e) {
    print("❌ Lỗi khi tải .env: $e");
  }
   provideDependencies();
    final GlobalManager _globalManager = Get.find();
  runApp(
    GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
      navigatorKey: _globalManager.navigatorKey, 
      initialRoute: AppRoute.signIn.name,
      onGenerateRoute: AppRouteExt.generateRoute,
     
    ),
  );
}
