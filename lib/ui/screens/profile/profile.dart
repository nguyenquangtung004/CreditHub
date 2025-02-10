import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/constant/constant.dart';
import '../../../data/model/auth/user/user.dart';
import '../../../shared/app_manager.dart';
import '../../../shared/app_route.dart';
import '../../widgets/profile/custom_button_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: context.read<AppManager>().getUserInfo(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator()); // Hiển thị khi đang tải dữ liệu
        }

        final user = snapshot.data!;

        return Scaffold(
          body: Container(
            color: Colors.grey.withOpacity(0.1),
            child: Stack(
              children: [
                const Column(
                  children: [_customBackground()],
                ),
                Positioned(
                  top: 170,
                  left: 20,
                  right: 20,
                  child: Container(
                    width: 325,
                    height: 87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0, left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            user.name.isNotEmpty ? user.name : "Người dùng",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            user.username.isNotEmpty ? user.username : "Không có mã đại lý",
                            style: const TextStyle(
                              color: Color.fromRGBO(126, 126, 126, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 280,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: _listButton(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


class _customBackground extends StatelessWidget {
  const _customBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 74, 74, 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          height: 220,
          width: double.infinity,
        ),
        Positioned(
          left: 90,
          top: 90,
          child: Transform(
            transform: Matrix4.rotationZ(-0.1),
            child: Image.asset(
              itemProfile01,
              height: 100,
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(35),
            ),
            child: Image.asset(
              background_profile,
              height: 220,
            ),
          ),
        ),
        Positioned(
          right: -40,
          child: Image.asset(
            itemProfile02,
            height: 220,
          ),
        ),
        Positioned(
          left: 90,
          top: 90,
          child: Transform(
            transform: Matrix4.rotationZ(-0.1),
            child: Image.asset(
              itemProfile01,
              height: 100,
            ),
          ),
        ),
        Positioned(
          right: -60,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(35),
            ),
            child: Image.asset(
              itemProfile03,
              height: 220,
            ),
          ),
        ),
      
      ],
    );
  }
}

class _listButton extends StatelessWidget {
  const _listButton({
    super.key,
  });

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
      ],
    );
  }
}
