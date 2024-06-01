import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_elements/button/button.dart';
import 'package:ui_elements/colors.dart';
import 'package:ui_elements/constants.dart';
import 'package:ui_elements/sizes.dart';
import 'package:ui_elements/text_styles.dart';

class DialogManager {
  static void showAppDialog({
    required BuildContext context,
    required String title,
    required String svgPath,
    String? message,
    String? positiveText,
    String? negativeText,
    bool dismissible = true,
    bool autoDismiss = false,
    int? autoDismissTime,
    VoidCallback? onPositiveClick,
    VoidCallback? onNegativeClick,
  }) {
    if (autoDismiss) {
      dismissible = false;
      if (autoDismissTime == null) {
        throw ArgumentError("autoDismissTime should not null if autoDismiss is true");
      } else {
        Future.delayed(Duration(seconds: autoDismissTime), () {
          Navigator.of(context).pop();
        });
      }
    }

    showGeneralDialog(
       barrierLabel: "uidialog",
        context: context,
        barrierDismissible: dismissible,
       transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
        pageBuilder: (context,anim1,anim2) {
          return PopScope(
            canPop: dismissible,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppDimensionsConstants.deafultBorderRadius)),
              ),
              contentPadding: const EdgeInsets.all(AppSizes.size20),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    svgPath,
                    width: 125.0,
                    height: 125.0,
                  ),
                  const SizedBox(height: AppSizes.size20),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regular(fontSize: AppSizes.size22, color: AppColor.primaryTextColor),
                  ),
                  const SizedBox(height: AppSizes.size10),
                  if (message != null)
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.regular(fontSize: AppSizes.size16, color: AppColor.subtitleTextColor),
                    ),
                  const SizedBox(height: AppSizes.size20),
                  if (positiveText != null)
                    AppButton.error(
                        onPressed: onPositiveClick != null ? (){
                          Navigator.of(context).pop();
                          onPositiveClick.call();
                        } : ()=> Navigator.pop(context),
                        title: positiveText),
                  const SizedBox(height: AppSizes.size20),
                  if (negativeText != null)
                    InkWell(
                        onTap: onNegativeClick != null ? (){
                          Navigator.of(context).pop();
                          onNegativeClick.call();
                        } : ()=> Navigator.pop(context),
                        child: Text(
                          negativeText,
                          style: AppTextStyle.regular(fontSize: AppSizes.size18, color: AppColor.subtitleTextColor),
                        ))
                ],
              ),
            ),
          );
        });
  }
}
