import 'package:flutter/material.dart';
import 'package:ui_elements/ui_elements.dart';

/// A reusable AppBar widget that can be configured as either a primary or secondary AppBar.
///
/// The primary AppBar displays a single title, while the secondary AppBar displays a title
/// and a subtitle, along with optional leading and action icons.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onIconPressed;
  final bool isSecondary;
  final Widget? leadingIcon;
  final Widget? actionIcon;

  /// Private constructor for initializing the reusable AppBar.
  const CustomAppBar._({
    required this.title,
    this.subtitle,
    this.onLeadingPressed,
    this.onIconPressed,
    this.isSecondary = false,
    this.leadingIcon,
    this.actionIcon,
  });

  /// Factory constructor for creating a primary AppBar.
  ///
  /// The primary AppBar only includes a title and an optional leading icon.
  factory CustomAppBar.primary({
    required String title,
    VoidCallback? onLeadingPressed,
  }) {
    return CustomAppBar._(
      title: title,
      onLeadingPressed: onLeadingPressed,
    );
  }

  /// Factory constructor for creating a secondary AppBar.
  ///
  /// The secondary AppBar includes a title, a subtitle, an optional leading icon, and an action icon.
  factory CustomAppBar.secondary({
    required String title,
    required String subtitle,
    required VoidCallback onIconPressed,
    required VoidCallback onLeadingPressed,
    Widget? leadingIcon,
    Widget? actionIcon,
  }) {
    return CustomAppBar._(
      title: title,
      subtitle: subtitle,
      onIconPressed: onIconPressed,
      onLeadingPressed: onLeadingPressed,
      isSecondary: true,
      leadingIcon: leadingIcon,
      actionIcon: actionIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backgroundColor,
      centerTitle: true,
          leading: GestureDetector(
        onTap: onLeadingPressed ?? () => Navigator.pop(context),
        child: Visibility(
          visible: isSecondary && leadingIcon != null,
          replacement: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.whiteColor,
          ),
          child: leadingIcon ?? const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.whiteColor,
          ),
        ),
      ),
     title: Visibility(
        visible: isSecondary,
        replacement: Text(
          title,
          style: AppTextStyle.semiBold(
            fontSize: AppSizes.size20,
            color: AppColor.whiteColor,
          ),
        ),
        child: _buildSecondaryTitle(),
      ),
     actions: [
        Visibility(
          visible: isSecondary && actionIcon != null,
          child: IconButton(
            onPressed: onIconPressed,
            icon: actionIcon ?? const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  /// Builds the secondary title which includes the title and subtitle.
  Widget _buildSecondaryTitle() {
    return Column(
     
      children: [
        Text(
          title,
          style: AppTextStyle.regular(
            fontSize: AppSizes.size18,
            color: AppColor.whiteColor,
          ),
        ),
        Text(
          subtitle ?? '',
          style: AppTextStyle.bold(
            fontSize: AppSizes.size26,
            color: AppColor.whiteColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        isSecondary ? kToolbarHeight + 40.0 : kToolbarHeight,
      );
}
