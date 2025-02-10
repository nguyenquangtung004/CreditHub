import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:credit_hub_app/shared/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_string.dart';
import '../widgets/profile/custom_button_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Đại lý đức thịnh",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "DL286",
                          style: TextStyle(
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
