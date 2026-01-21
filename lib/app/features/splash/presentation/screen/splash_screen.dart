import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_images.dart';
import 'package:scube/app/features/splash/provider/splash_providers.dart';
import 'package:scube/app/shared/component/image/common_image.dart';
import 'package:scube/app/shared/component/text/common_text.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider state and initialize once
    ref.watch(splashProvider);

    // Initialize splash logic once after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashProvider.notifier).onInit(context);
    });

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonImage(imageSrc: AppImages.logo, size: 100.w),
            CommonText(
              text: 'Scube',
              color: AppColors.textSecondary,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
            CommonText(
              text: 'Control & Monitoring System',
              color: AppColors.textSecondary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
