import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum IconType { svg, png, jpg, network }

class AppIconData {
  final String iconPath;
  final IconType iconType;

  const AppIconData({required this.iconPath, required this.iconType});
}

class AppIcon extends StatelessWidget {
  const AppIcon({
    Key? key,
    this.icon,
    this.size,
    this.color,
    this.semanticsLabel,
    this.textDirection,
    this.shadows,
  }) : super(key: key);

  final AppIconData? icon;
  final double? size;
  final Color? color;
  final String? semanticsLabel;
  final TextDirection? textDirection;
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double? iconSize = size ?? iconTheme.size;

    Widget iconWidget;

    switch (icon?.iconType) {
      case IconType.png:
      case IconType.jpg:
        iconWidget = Image.asset(
          icon!.iconPath,
          height: iconSize,
          width: iconSize,
          color: color,
          fit: BoxFit.contain,
        );
        break;
      case IconType.network:
        iconWidget = Image.network(
          icon!.iconPath,
          height: iconSize,
          width: iconSize,
          color: color,
          fit: BoxFit.contain,
        );
        break;
      case IconType.svg:
      default:
        iconWidget = SvgPicture.asset(
          icon!.iconPath,
          width: iconSize,
          height: iconSize,
          colorFilter: color != null
              ? ColorFilter.mode(
                  color!, // Set the desired color here
                  BlendMode.srcIn,
                )
              : null,
        );
        break;
    }

    if (shadows != null) {
      iconWidget = Container(
        decoration: BoxDecoration(
          boxShadow: shadows,
        ),
        child: iconWidget,
      );
    }

    return Semantics(
      label: semanticsLabel,
      child: Directionality(
        textDirection: textDirection ?? TextDirection.ltr,
        child: iconWidget,
      ),
    );
  }
}
