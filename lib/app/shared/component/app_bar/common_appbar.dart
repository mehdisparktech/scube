import 'package:flutter/material.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/shared/component/text/common_text.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButton;
  final bool centerTitle;
  final List<Widget>? actions;
  final VoidCallback? onPressed;
  const CommonAppBar({
    super.key,
    required this.title,
    this.isBackButton = true,
    this.centerTitle = true,
    this.actions,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CommonText(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      centerTitle: centerTitle,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: isBackButton
          ? IconButton(
              onPressed: onPressed ?? () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new),
              color: AppColors.black,
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
