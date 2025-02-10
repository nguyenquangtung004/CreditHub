import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../theme/app_theme.dart';
import '../../button/app_button.dart';
import '../../constant/app_color.dart';
// import 'package:valuation/src/components/button/app_button.dart';
// import 'package:valuation/src/constant/app_colors.dart';
// import 'package:valuation/theme/app_theme.dart';

class AppDialog extends StatefulWidget {
  const AppDialog({
    Key? key,
    this.title,
    this.msg,
    this.okText = 'Đồng ý',
    this.cancelText,
    this.okHandler,
    this.cancelHandler,
    this.closeHandler,
    this.content,
    this.padding,
    this.showButtonOK = true,
    this.showButton,
    this.dismissAble,
  }) : super(key: key);
  final bool? dismissAble;
  final String? title;
  final String? msg;
  final String okText;
  final String? cancelText;
  final VoidCallback? okHandler;
  final VoidCallback? cancelHandler;
  final VoidCallback? closeHandler;
  final Widget? content;
  final bool? showButton;
  final bool showButtonOK;
  final EdgeInsetsGeometry? padding;

  static var isShowing = false;

  @override
  State<AppDialog> createState() => _AppDialogState();

  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    String? msg,
    String okText = 'Đồng ý',
    String? cancelText,
    VoidCallback? okHandler,
    VoidCallback? cancelHandler,
    VoidCallback? closeHandler,
    EdgeInsetsGeometry? padding,
    bool showButton = true,
    bool showButtonOK = true,
    bool dismissAble = true,
    Widget? content,
  }) async {
    if (Get.isDialogOpen == true && isShowing) {
      Get.back();
    }
    final result = await Get.dialog<T>(
      PopScope(
        canPop: false,
        child: AppDialog(
          title: title ?? 'Thông báo',
          msg: msg,
          okText: okText,
          cancelText: cancelText,
          padding: padding,
          okHandler: okHandler,
          showButton: showButton,
          dismissAble: dismissAble,
          showButtonOK: showButtonOK,
          cancelHandler: cancelHandler,
          closeHandler: closeHandler,
          content: content,
        ),
      ),
      barrierDismissible: false,
    );
    isShowing = true;
    return result;
  }

  static void dismiss() {
    if (Get.isDialogOpen == true && isShowing) {
      Get.back();
      isShowing = false;
    }
  }
}

class _AppDialogState extends State<AppDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 2,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.title != null) ...[
                const Gap(15),
                _buildTitle(context),
                const Gap(10),
                const Divider(
                  height: 0.5,
                  color: AppColors.grey3,
                ),
                const Gap(5),
              ],
              _buildBody(),
              if ((widget.showButton ?? false) &&
                  (widget.showButtonOK || widget.cancelText != null))
                const Gap(20),
              if ((widget.showButton ?? false) &&
                  (widget.showButtonOK || widget.cancelText != null))
                _buildButtons(),
              if ((widget.showButton ?? false) &&
                  (widget.showButtonOK || widget.cancelText != null))
                const Gap(14),
            ]);
      }),
    );
  }

  Widget _buildTitle(context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Expanded(
          child: Text(widget.title!,
              style: AppTheme.of(context).text_20_600,
              textAlign: TextAlign.center))
    ]);
  }

  Widget _buildBody() {
    return Flexible(
      child: Container(
        padding: widget.padding ??
            ((widget.title == null)
                ? const EdgeInsets.all(20)
                : const EdgeInsets.only(left: 30, right: 30, top: 12)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.msg != null)
                Text(
                  widget.msg!,
                  style: AppTheme.of(context)
                      .text_16_500
                      .copyWith(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              widget.content ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: AppColors.mainColor),
      child: Column(
        children: [
          if (widget.showButtonOK)
            AppButton(
              label: widget.okText,
              state: AppButtonState.primary,
              color: AppColors.white,
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white),
              size: AppButtonSize.large,
              onPressed: () {
                if (widget.dismissAble == true) {
                  Navigator.pop(context, true);
                  AppDialog.isShowing = false;
                }
                if (widget.okHandler != null) {
                  widget.okHandler!();
                }
              },
            ),
          if (widget.cancelText != null || widget.cancelHandler != null) ...[
            const Gap(10),
            InkWell(
              onTap: () {
                Navigator.pop(context, false);
                AppDialog.isShowing = false;
                if (widget.cancelHandler != null) {
                  widget.cancelHandler!();
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 44,
                width: double.infinity,
                child: Text(
                  widget.cancelText ?? '',
                  textAlign: TextAlign.center,
                  style: AppTheme.of(context)
                      .text_14_500
                      .copyWith(color: AppColors.primary),
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
