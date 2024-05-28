import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_elements/colors.dart';
import 'package:ui_elements/text_styles.dart';

class SimpleAppBar extends StatelessWidget{
  String title;
  IconData? icon;
  VoidCallback? onBack;

  SimpleAppBar({
    super.key,
    required this.title,
    this.icon = Icons.arrow_back_ios_new_outlined,
    this.onBack
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(top: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(icon != null)
            InkWell(onTap: onBack,child: Icon(icon,color: AppColor.whiteColor,)),
          Text(title,style: AppTextStyle.regular(
              fontSize: 18,
              color: AppColor.whiteColor
          ),),
            Icon(icon,color: Colors.transparent),
        ],
      ),
    );
  }
}