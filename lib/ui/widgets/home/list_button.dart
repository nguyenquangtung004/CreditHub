import 'package:credit_hub_app/shared/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/constant/constant.dart';
import '../profile/custom_button_profile.dart';

class listButton extends StatelessWidget {
  const listButton({
    super.key,
  });
  // Hàm xóa token
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Xóa token khỏi bộ nhớ
    print('Token đã bị xóa');
    Get.offAllNamed(AppRoute.signIn.name); // Chuyển về màn hình đăng nhập
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBottomProfile(
          text_button_profile: titleProfile01,
          onPressed: () {},
          icon: Icons.person,
        ),
        h(10),
        CustomBottomProfile(
          text_button_profile: titleProfile02,
          onPressed: () {
            Get.toNamed(AppRoute.accountList.name);
          },
          icon: Icons.price_change_rounded,
        ),
        h(10),
           CustomBottomProfile(
          text_button_profile: 'Đăng xuất',
          onPressed: _logout,
          icon: Icons.logout_sharp,
        ),
      ],
    );
  }
}
