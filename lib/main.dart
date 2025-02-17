import 'package:credit_hub_app/data/repository/account/account_repo.dart';
import 'package:credit_hub_app/data/repository/account/account_repo_impl.dart';
import 'package:credit_hub_app/data/repository/account_list/account_list_repo.dart';
import 'package:credit_hub_app/data/repository/home/home_rep.dart';
import 'package:credit_hub_app/data/service/account_bank_list/account_bank_service.dart';
import 'package:credit_hub_app/data/service/account_bank_list/account_bank_service_api.dart';
import 'package:credit_hub_app/data/service/account_list/account_service.dart';
import 'package:credit_hub_app/data/service/account_list/account_service_api.dart';
import 'package:credit_hub_app/ui/screens/add_account/cubit/add_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'core/constant/constant.dart';
import 'core/utils/dependencies.dart';
import 'data/_base/network_manager.dart';
import 'data/repository/account_list/account_list_repo_impl.dart';
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
import 'ui/screens/add_withdrawal_request/cubit/add_withdrawal_request_cubit.dart';
import 'ui/screens/forgot_password/cubit/forgot_password_cubit.dart';
import 'ui/screens/home/cubit/home_cubit.dart';
import 'ui/screens/list_account_screen/cubit/list_account_cubit_cubit.dart';
import 'ui/screens/otp/cubit/otp_cubit.dart';
import 'ui/screens/request/cubit/request_cubit.dart';
import 'ui/screens/sign_in/sign_in.dart';

// 🔥 Import liên quan đến RequestCubit
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

        /* ----------------------- /// ✅ **Cấu hình Service** ----------------------- */
        RepositoryProvider<HomeService>(create: (context) => HomeService(dio)),
        RepositoryProvider<ForgotPassWordService>(create: (context) => ForgotPassWordService(dio)),
        RepositoryProvider<OtpService>(create: (context) => OtpService(dio)),
        RepositoryProvider<RequestService>(create: (context) => RequestService(dio)), // 🔥 Thêm RequestService
        RepositoryProvider<AccountService>(
          create: (context) {
            print("✅ AccountService created!");
            return AccountService(dio);
          },
        ),
        RepositoryProvider<AccountBankService>(
          create: (context) {
            print("✅ AccountBankService created!");
            return AccountBankService(dio);
          },
        ),
        RepositoryProvider<AccountServiceApi>(
          create: (context) {
            print("✅ AccountServiceApi created!");
            return AccountServiceApi(service: context.read<AccountService>());
          },
        ),

        /* ---------------------- /// ✅ **Cấu hình Repository** --------------------- */
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
          create: (context) => RequestRepoImpl(requestService: context.read<RequestService>()),
        ),
        RepositoryProvider<AccountListRepo>(
          create: (context) {
            print("✅ AccountListRepo created!");
            return AccountListRepoImpl(accountServiceApi: context.read<AccountServiceApi>());
          },
        ),
        RepositoryProvider<AccountRepo>(
          create: (context) => AccountBankImpl(accountService: context.read<AccountBankService>()),
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
            create: (context) {
              final String email = Get.arguments ?? ''; // Lấy email từ màn trước (nếu có)
              return OtpCubit(context.read<OtpRepository>(), email: email);
            },
          ),
          BlocProvider<RequestCubit>(
            create: (context) => RequestCubit(context.read<RequestRepo>()),
          ),
          BlocProvider<AddWithdrawalRequestCubit>(
            create: (context) => AddWithdrawalRequestCubit(requestRepo: context.read<RequestRepo>()),
          ),
          BlocProvider<AddAccountCubit>(
            create: (context) => AddAccountCubit(accountListRepo: context.read<AccountListRepo>()),
          ),
          BlocProvider<ListAccountCubit>(
  create: (context) => ListAccountCubit(accountRepo: context.read<AccountRepo>()),
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
