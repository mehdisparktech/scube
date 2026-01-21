import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_icons.dart';
import 'package:scube/app/shared/component/image/common_image.dart';
import 'package:scube/app/shared/component/text/common_text.dart';

class DashboardSecondConstants {
  static const Color activeBlue = Color(0xFF0096FC);
  static const Color inactiveGrey = Color(0xFFE0E0E0);
  static const Color textDark = Color(0xFF082438);
  static const Color textGrey = Color(0xFF5E5E5E);
  static const Color activeGreen = Color(0xFF00C853);
  static const Color inactiveRed = Color(0xFFD50000);
}

class DashboardTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const DashboardTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
      ),
      child: Row(
        children: [
          _buildTab("Summery", 0),
          _buildTab("SLD", 1),
          _buildTab("Data", 2),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? DashboardSecondConstants.activeBlue
                : Colors.white,
            borderRadius: index == 0
                ? BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  )
                : (index == 2
                      ? BorderRadius.only(topRight: Radius.circular(10.r))
                      : null),
          ),
          alignment: Alignment.center,
          child: CommonText(
            text: title,
            color: isSelected
                ? Colors.white
                : DashboardSecondConstants.textGrey,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class SourceLoadToggle extends StatelessWidget {
  final bool isSourceSelected;
  final Function(bool) onToggle;

  const SourceLoadToggle({
    super.key,
    required this.isSourceSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(true),
              child: Container(
                decoration: BoxDecoration(
                  color: isSourceSelected
                      ? DashboardSecondConstants.activeBlue
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: CommonText(
                  text: "Source",
                  color: isSourceSelected
                      ? Colors.white
                      : AppColors.textTertiary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(false),
              child: Container(
                decoration: BoxDecoration(
                  color: !isSourceSelected
                      ? DashboardSecondConstants.activeBlue
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: CommonText(
                  text: "Load",
                  color: !isSourceSelected
                      ? Colors.white
                      : AppColors.textTertiary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final double progress; // 0 to 1
  final Color color;
  final Color backgroundColor;

  DonutChartPainter({
    required this.progress,
    required this.color,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    final strokeWidth = 20.w;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, bgPaint);

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * pi * progress;
    // Start from top (-pi/2)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DonutChartSection extends StatelessWidget {
  final String totalPower;

  const DonutChartSection({super.key, required this.totalPower});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        CommonText(
          text: "Electricity",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        Divider(
          color: AppColors.border,
          thickness: 1,
          indent: 20.w,
          endIndent: 20.w,
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: 150.w,
          height: 150.w, // Square
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(150.w, 150.w),
                painter: DonutChartPainter(
                  progress: 0.75, // Static example matching image ~75%
                  color: DashboardSecondConstants.activeBlue,
                  backgroundColor: const Color(0xFFD2EAFB),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    text: "Total Power",
                    fontSize: 12,
                    color: DashboardSecondConstants.textDark,
                  ),
                  SizedBox(height: 5.h),
                  CommonText(
                    text: totalPower,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: DashboardSecondConstants.textDark,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

class DataListCard extends StatelessWidget {
  final String title;
  final String status; // Active/Inactive
  final String data1;
  final String data2;
  final String iconSrc;
  final Color iconColor;
  final Color statusColor;

  const DataListCard({
    super.key,
    required this.title,
    required this.status,
    required this.data1,
    required this.data2,
    required this.iconSrc,
    this.iconColor = Colors.orange,
    this.statusColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE5F4FE),
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Box
          CommonImage(imageSrc: iconSrc, size: 24.sp),
          SizedBox(width: 10.w),
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Status Square
                    Container(width: 10.w, height: 10.w, color: iconColor),
                    SizedBox(width: 5.w),
                    CommonText(
                      text: title,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    SizedBox(width: 5.w),
                    CommonText(
                      text: "($status)",
                      color: statusColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                _buildDataRow("Data 1", data1),
                _buildDataRow("Data 2", data2),
              ],
            ),
          ),
          CommonImage(imageSrc: AppIcons.arrowForwardIos, size: 24.sp),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        children: [
          SizedBox(
            width: 50.w,
            child: CommonText(
              text: label,
              color: AppColors.textTertiary,
              fontSize: 12,
              textAlign: TextAlign.start,
            ),
          ),
          CommonText(text: ":", color: AppColors.textTertiary, fontSize: 12),
          SizedBox(width: 5.w),
          CommonText(
            text: value,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: DashboardSecondConstants.textDark,
          ),
        ],
      ),
    );
  }
}

class ActionGridItem extends StatelessWidget {
  final String title;
  final String iconSrc; // Placeholder for image assets
  final Color iconColor;

  const ActionGridItem({
    super.key,
    required this.title,
    required this.iconSrc,
    this.iconColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonImage(imageSrc: iconSrc, size: 24.sp),
          SizedBox(width: 10.w),
          Flexible(
            child: CommonText(
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textTertiary,
              textAlign: TextAlign.start,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
