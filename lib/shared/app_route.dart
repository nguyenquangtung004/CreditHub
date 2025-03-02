import 'package:credit_hub_app/ui/screens/add_account/add_account.dart';
import 'package:credit_hub_app/ui/screens/add_withdrawal_request/add_withdrawal_request.dart';
import 'package:credit_hub_app/ui/screens/detail/detail_request.dart';
import 'package:credit_hub_app/ui/screens/request/history.dart';
import 'package:credit_hub_app/ui/screens/list_account_screen/list_account_screen.dart';
import 'package:credit_hub_app/ui/screens/otp/otp_screen.dart';
import 'package:credit_hub_app/ui/widgets/bottom_navigator/custom_bottom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/screens/forgot_password/forgot_password.dart';
import '../ui/screens/sign_in/bloc/cubit/sign_in_cubit.dart';
import '../ui/screens/sign_in/sign_in.dart'; //NOTE :Thư viện GetX

enum AppRoute {
  signIn,
  forgotPassword,
  home,
  addWithdrawalRequest,
  notifications,
  requestHistory,
  requestDetails,
  profile,
  accountList,
  addAccount,
  enterOtp,
  main,
}

extension AppRouteExt on AppRoute {
  String get route {
    switch (this) {
      case AppRoute.signIn:
        return '/sign_in';
      case AppRoute.forgotPassword:
        return '/forgot_password';
      case AppRoute.home:
        return '/home';
      case AppRoute.addWithdrawalRequest:
        return '/add_withdrawal_request';
      case AppRoute.notifications:
        return '/notifications';
      case AppRoute.requestHistory:
        return '/request_history';
      case AppRoute.requestDetails:
        return '/request_details';
      case AppRoute.profile:
        return '/profile';
      case AppRoute.accountList:
        return '/account_list';
      case AppRoute.addAccount:
        return '/add_account';
      case AppRoute.enterOtp:
        return '/enter_otp';
      case AppRoute.main:
        return '/main';
      default:
        return '';
    }
  }

  static AppRoute? from(String? name) {
    for (final item in AppRoute.values) {
      if (item.name == name) {
        return item;
      }
    }
    return null;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (AppRouteExt.from(settings.name)) {
      case AppRoute.signIn:
        return GetPageRoute(
          settings: settings,
          page: () => const SignInScreen(),
          bindings: [
            BindingsBuilder.put(() => SignInCubit(Get.find(), Get.find()))
          ],
          transition: Transition.cupertino,
        );
      case AppRoute.forgotPassword:
        return GetPageRoute(
          settings: settings,
          page: () => const ForgotPasswordScreen(),
          // bindings: [
          //   BindingsBuilder.put(() => ForgotPasswordCubit(Get.find()))
          // ],
          transition: Transition.cupertino,
        );
      case AppRoute.addWithdrawalRequest:
        return GetPageRoute(
          settings: settings,
          page: () => const AddWithDrawalRequestScreen(),
          bindings: [
            BindingsBuilder.put(() => SignInCubit(Get.find(), Get.find()))
          ],
          transition: Transition.cupertino,
        );
      case AppRoute.enterOtp:
        return GetPageRoute(
          settings: settings,
          page: () => const OtpScreen(),
          // bindings: [
          //   BindingsBuilder.put(() => SignInCubit(Get.find(), Get.find()))
          // ],
          transition: Transition.cupertino,
        );
       case AppRoute.accountList:
        return GetPageRoute(
          settings: settings,
          page: () => const ListAccountScreen(),
          // bindings: [
          //   BindingsBuilder.put(() => ForgotPasswordCubit(Get.find()))
          // ],
          transition: Transition.cupertino,
        );
      case AppRoute.main:
        return GetPageRoute(
          settings: settings,
          page: () => const CustomBottomNavigator(),
          bindings: [
            // BindingsBuilder.put(() => AccountCubit(Get.find())),
            // BindingsBuilder.put(() => UserInfoCubit(Get.find(), Get.find())),
            // BindingsBuilder.put(() => ProductCategoryCubit(Get.find())),
            // BindingsBuilder.put(() => HomeCubit(Get.find(), Get.find())),
            // BindingsBuilder.put(() => NotificationCubit(Get.find())),
            // BindingsBuilder.put(() => NewsCubit(Get.find()))
          ],
          transition: Transition.cupertino,
        );
      case AppRoute.requestHistory:
        return GetPageRoute(
          settings: settings,
          page: () => HistoryScreen(
           
          ),
          bindings: [
            // BindingsBuilder.put(() => AccountCubit(Get.find())),
            // BindingsBuilder.put(() => UserInfoCubit(Get.find(), Get.find())),
            // BindingsBuilder.put(() => ProductCategoryCubit(Get.find())),
            // BindingsBuilder.put(() => HomeCubit(Get.find(), Get.find())),
            // BindingsBuilder.put(() => NotificationCubit(Get.find())),
            // BindingsBuilder.put(() => NewsCubit(Get.find()))
          ],
          transition: Transition.cupertino,
        );
        case AppRoute.addAccount:
        return GetPageRoute(
          settings: settings,
          page: () => AddAccountScreen(
           
          ),
          bindings: [
           
          ],
          transition: Transition.cupertino,
        );
        case AppRoute.requestDetails:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return GetPageRoute(
          settings: settings,
          page: () => DetailRequestScreen(requestId: args?["requestId"], // ✅ Nhận requestId từ arguments
         
          ),
          bindings: [
  
          ],
          transition: Transition.cupertino,
        );
      default:
        return GetPageRoute(
          settings: settings,
          page: () => Scaffold(
            appBar: AppBar(),
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
