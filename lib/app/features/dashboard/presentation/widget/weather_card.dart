import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_images.dart';
import 'package:scube/app/core/constants/app_strings.dart';
import 'package:scube/app/features/dashboard/domain/entity/dashboard_entity.dart';
import 'package:scube/app/shared/component/image/common_image.dart';
import 'package:scube/app/shared/component/text/common_text.dart';

class WeatherCard extends StatelessWidget {
  final DashboardEntity data;

  const WeatherCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        color: AppColors.gradient1,
        borderRadius: BorderRadius.circular(12.r),
        gradient: const LinearGradient(
          colors: [
            AppColors.gradient1,
            AppColors.gradient1,
            AppColors.gradient2,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 0.2, 1.0],
        ),
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
          // Left Side: Temperature
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: data.temperature,
                            style: GoogleFonts.inter(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                            children: [
                              TextSpan(
                                text: AppStrings.celsius,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        CommonText(
                          text: AppStrings.moduleTemperature,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textTertiary,
                          textAlign: TextAlign.left,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  CommonImage(imageSrc: data.thermometerImage),
                ],
              ),
            ),
          ),

          // Right Side: Gradient details
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonText(
                          text: data.windSpeed,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          textAlign: TextAlign.left,
                        ),
                        CommonText(
                          text: AppStrings.windSpeedDirection,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textQuinary,
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 50.w,
                            left: 20.w,
                            top: 6.h,
                            bottom: 6.h,
                          ),
                          child: CommonImage(imageSrc: AppImages.divider),
                        ),
                        CommonText(
                          text: data.effectiveIrradiation,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          textAlign: TextAlign.left,
                        ),
                        CommonText(
                          text: AppStrings.effectiveIrradiation,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textQuinary,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  CommonImage(imageSrc: data.weatherIcon, size: 60.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
