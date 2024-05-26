import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_elements/button/app_button.dart';
import 'package:ui_elements/colors.dart';
import 'package:ui_elements/text_styles.dart';

class DialogManager{
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
    if(autoDismiss) {
      dismissible = false;
      if(autoDismissTime == null) {
        throw ArgumentError("autoDismissTime should not null if autoDismiss is true");
      }else{
        Future.delayed(Duration(seconds: autoDismissTime),(){
          Navigator.of(context).pop();
        });
      }
    }

    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context){
        return PopScope(
          canPop: dismissible,
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            contentPadding: const EdgeInsets.all(20.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(svgPath,width: 125.0,height: 125.0,),
                const SizedBox(height: 20.0),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regular(fontSize: 22.0, color: AppColor.primaryTextColor),
                ),
                const SizedBox(height: 10.0),
                if(message != null)
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regular(fontSize: 16.0, color: AppColor.subtitleTextColor),
                  ),
                const SizedBox(height: 20.0),
                if(positiveText != null)
                  AppButton.error(onPressed: onPositiveClick??(){}, title: positiveText),

                const SizedBox(height: 20.0),
                if(negativeText != null)
                  InkWell(
                    onTap: onNegativeClick??(){
                      Navigator.of(context).pop();
                    },
                    child: Text(negativeText,style: AppTextStyle.regular(fontSize: 18.0, color: AppColor.subtitleTextColor),))
              ],
            ),
          ),
        );
    });
  }

}