import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_strings.dart';
import 'package:scube/app/features/dashboard/domain/entity/dashboard_entity.dart';
import 'package:scube/app/shared/component/text/common_text.dart';

class DataListWidget extends StatelessWidget {
  final DashboardEntity data;

  const DataListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(flex: 1),
                Expanded(
                  child: Center(
                    child: CommonText(
                      text: AppStrings.yesterdaysData,
                      fontSize: 11,
                      color: const Color(0xFF1E234C),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: CommonText(
                      text: AppStrings.todaysData,
                      fontSize: 11,
                      color: const Color(0xFF1E234C),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEDF2F7)),
          _buildDataRow(
            AppStrings.acMaxPower,
            data.yesterdayMaxPower,
            data.todayMaxPower,
          ),
          const Divider(height: 1, color: Color(0xFFEDF2F7)),
          _buildDataRow(
            AppStrings.netEnergy,
            data.yesterdayNetEnergy,
            data.todayNetEnergy,
            isBold: true,
          ),
          const Divider(height: 1, color: Color(0xFFEDF2F7)),
          _buildDataRow(
            AppStrings.specificYield,
            data.yesterdaySpecificYield,
            data.todaySpecificYield,
          ),
          const Divider(height: 1, color: Color(0xFFEDF2F7)),
          // Duplicate rows as per image
          _buildDataRow(
            AppStrings.netEnergy,
            data.yesterdayNetEnergy,
            data.todayNetEnergy,
            isBold: true,
          ),
          const Divider(height: 1, color: Color(0xFFEDF2F7)),
          _buildDataRow(
            AppStrings.specificYield,
            data.yesterdaySpecificYield,
            data.todaySpecificYield,
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(
    String label,
    String val1,
    String val2, {
    bool isBold = false,
  }) {
    Color bg = isBold ? AppColors.secondary : Colors.white;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CommonText(
              text: label,
              fontSize: 12,
              color: AppColors.textTertiary,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: CommonText(
              text: val1,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          Expanded(
            child: CommonText(
              text: val2,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
        ],
      ),
    );
  }
}
