import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_images.dart';
import 'package:scube/app/core/constants/app_strings.dart';
import 'package:scube/app/shared/component/image/common_image.dart';
import 'package:scube/app/shared/component/text/common_text.dart';

class InfoCardsWidget extends StatelessWidget {
  const InfoCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CommonImage(imageSrc: AppImages.totalNumOfPvModule, size: 20.sp),
          CommonText(
            text: AppStrings.totalNumOfPvModule,
            fontSize: 11,
            color: AppColors.textTertiary,
          ),
          SizedBox(width: 4.w),
          CommonText(
            text: ":   6372 pcs. (585 Wp each)",
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
        ],
      ),
    );
  }
}
