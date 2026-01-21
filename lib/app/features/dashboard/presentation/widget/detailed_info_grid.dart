import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_images.dart';
import 'package:scube/app/core/constants/app_strings.dart';
import 'package:scube/app/shared/component/image/common_image.dart';
import 'package:scube/app/shared/component/text/common_text.dart';

class DetailedInfoGrid extends StatelessWidget {
  const DetailedInfoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDetailCard(
                AppImages.totalDcCapacity,
                AppStrings.totalAcCapacity,
                "3000 KW",
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildDetailCard(
                AppImages.totalAcCapacity,
                AppStrings.totalDcCapacity,
                "3.727 MWp",
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: _buildDetailCard(
                AppImages.dateOfCommissioning,
                AppStrings.dateOfCommissioning,
                "17/07/2024",
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildDetailCard(
                AppImages.numberOfInverter,
                AppStrings.numberOfInverter,
                "30",
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: _buildDetailCard(
                AppImages.totalAcCapacity,
                AppStrings.totalAcCapacity,
                "3000 KW",
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildDetailCard(
                AppImages.totalDcCapacity,
                AppStrings.totalDcCapacity,
                "3.727 MWp",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailCard(String iconSrc, String label, String value) {
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
          CommonImage(imageSrc: iconSrc, size: 22.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: label,
                  fontSize: 11,
                  color: AppColors.textTertiary,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 4.h),
                CommonText(
                  text: value,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
