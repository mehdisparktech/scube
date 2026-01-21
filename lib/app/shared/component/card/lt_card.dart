import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube/app/core/constants/app_images.dart';
import 'package:scube/app/shared/component/image/common_image.dart';
import 'package:scube/app/shared/component/text/common_text.dart';

class LTItemData {
  final String iconSrc;
  final String label;
  final String value;

  const LTItemData({
    required this.iconSrc,
    required this.label,
    required this.value,
  });
}

class LTCard extends StatelessWidget {
  final String title;
  final String capacityText;
  final List<LTItemData> items;

  const LTCard({
    super.key,
    required this.title,
    required this.capacityText,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E234C),
                ),
                Row(
                  children: [
                    CommonImage(imageSrc: AppImages.setting, size: 20.sp),
                    SizedBox(width: 4.w),
                    CommonText(
                      text: capacityText,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEDF2F7)),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _LTItem(data: items[0])),
                    SizedBox(width: 16.w),
                    Expanded(child: _LTItem(data: items[1])),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(child: _LTItem(data: items[2])),
                    SizedBox(width: 16.w),
                    Expanded(child: _LTItem(data: items[3])),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LTItem extends StatelessWidget {
  final LTItemData data;

  const _LTItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonImage(imageSrc: data.iconSrc, size: 20.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: data.label,
                fontSize: 10,
                color: const Color(0xFF718096),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 2.h),
              CommonText(
                text: data.value,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E234C),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
