import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_strings.dart';
import 'package:scube/app/route/app_routes.dart';
import 'package:scube/app/shared/component/text/common_text.dart';

class DashboardBanner extends StatelessWidget {
  const DashboardBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoutes.goToDashboardSecond(context);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.buttonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: AppStrings.secondPageNavigate,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            SizedBox(width: 8.w),
            Icon(Icons.arrow_forward_ios, size: 14.sp, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
