import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_images.dart';
import 'package:scube/app/core/constants/app_strings.dart';
import 'package:scube/app/features/dashboard/domain/entity/dashboard_entity.dart';
import 'package:scube/app/shared/component/image/common_image.dart';
import 'package:scube/app/shared/component/text/common_text.dart';

class StatsGrid extends StatelessWidget {
  final DashboardEntity data;

  const StatsGrid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                AppImages.liveAcPower,
                data.acPower,
                AppStrings.liveAcPower,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildStatCard(
                AppImages.plantGeneration,
                data.plantGeneration,
                AppStrings.plantGeneration,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildStatCard(
                AppImages.livePr,
                data.livePR,
                AppStrings.livePr,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                AppImages.cumulativePr,
                data.cumulativePR,
                AppStrings.cumulativePr,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildStatCard(
                AppImages.returnPvTillToday,
                data.returnPV,
                AppStrings.returnPvTillToday,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildStatCard(
                AppImages.totalEnergy,
                data.totalEnergy,
                AppStrings.totalEnergy,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String iconSrc, String value, String label) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonImage(imageSrc: iconSrc, size: 22.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: value,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 2.h),
                    CommonText(
                      text: label,
                      fontSize: 9,
                      color: AppColors.textTertiary,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
