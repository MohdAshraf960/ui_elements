import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_elements/colors.dart';
import 'package:ui_elements/text_styles.dart';
class AppListTile extends StatelessWidget{
  final String title;
  final VoidCallback? onPressed;
  final String? svgPath;

  const AppListTile({super.key,
    required this.title,
    this.onPressed,
    this.svgPath
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(16.0),
        color: AppColor.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              if(svgPath != null)
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color:AppColor.iconBackgroundColor,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: SvgPicture.asset(svgPath!),
                ),
              const SizedBox(width: 10,),
              Text(title,style: AppTextStyle.regular(
                fontSize: 18,
                color: AppColor.primaryTextColor
              ),),
            ],
          ),
        ),
      ),
    );
  }
}