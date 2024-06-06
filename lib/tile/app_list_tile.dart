
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_elements/colors.dart';
import 'package:ui_elements/constants.dart';
import 'package:ui_elements/sizes.dart';
import 'package:ui_elements/text_styles.dart';
class AppListTile extends StatelessWidget{
  final String title;
  final VoidCallback? onPressed;
  final String? svgPath;
  final Color? svgColor;
  

  const AppListTile({super.key,
    required this.title,
    this.onPressed,
    this.svgPath,
    this.svgColor
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 5.0,
        margin: const EdgeInsets.all(AppDimensionsConstants.defaultPadding),
        color: AppColor.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensionsConstants.deafultBorderRadius),
          child: Row(
            children: [
              if(svgPath != null)
                Container(
                  height: AppSizes.size50,
                  width: AppSizes.size50,
                  padding: const EdgeInsets.all(AppSizes.size12),
                  decoration: BoxDecoration(
                    color:AppColor.iconBackgroundColor,
                    borderRadius: BorderRadius.circular(AppSizes.size12)
                  ),
                  child: SvgPicture.asset(svgPath!, colorFilter: svgColor != null ? ColorFilter.mode(svgColor!,BlendMode.srcIn): null)),
              const SizedBox(width: AppSizes.size10),
              FittedBox(
                child: Text(title,style: AppTextStyle.regular(
                  fontSize: AppSizes.size18,
                  color: AppColor.primaryTextColor
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}