import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../theme/app_theme.dart';
import '../../constant/app_color.dart';

const String _kTitleText = 'Thông báo';
const String _kText =
    'Dữ liệu đang được xử lý. Xin vui lòng chờ trong giây lát';

class AppLoading extends StatelessWidget {
  const AppLoading({
    Key? key,
    this.barrierColor = Colors.black54,
    this.title = _kTitleText,
    this.text = _kText,
  }) : super(key: key);

  final Color barrierColor;
  final String title;
  final String text;

  static var isShowing = false;

  static void show() {
    if (Get.isDialogOpen == false) {
      Get.dialog(const AppLoading(), barrierDismissible: false);
      isShowing = true;
    }
  }

  static void showWith({String title = _kTitleText, required String text}) {
    if (Get.isDialogOpen == false) {
      Get.dialog(AppLoading(title: title, text: text));
      isShowing = true;
    }
  }

  static void dismiss() {
    if (Get.isDialogOpen == true && isShowing) {
      Get.back();
      isShowing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildProgress(context);
  }

  Widget _buildProgress(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                constraints:
                    const BoxConstraints(minWidth: 200.0, maxWidth: 280.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
                  child: Column(
                    children: [
                      Text(title,
                          textAlign: TextAlign.center,
                          style: AppTheme.of(context)
                              .text_16_500
                              .copyWith(decoration: TextDecoration.none)),
                      const Gap(10),
                      Text(text,
                          textAlign: TextAlign.center,
                          style: AppTheme.of(context)
                              .body2
                              .copyWith(decoration: TextDecoration.none)),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  color: AppColors.primary,
                ),
                child: Theme(
                    data: ThemeData(
                      cupertinoOverrideTheme:
                          const CupertinoThemeData(brightness: Brightness.dark),
                    ),
                    child: const CupertinoActivityIndicator()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
