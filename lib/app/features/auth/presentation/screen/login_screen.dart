import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_images.dart';
import 'package:scube/app/core/constants/app_string.dart';
import 'package:scube/app/core/utils/helpers/other_helper.dart';
import 'package:scube/app/features/auth/presentation/provider/auth_providers.dart';
import 'package:scube/app/features/auth/presentation/widget/do_not_account.dart';
import 'package:scube/app/shared/component/button/common_button.dart';
import 'package:scube/app/shared/component/image/common_image.dart';
import 'package:scube/app/shared/component/text/common_text.dart';
import 'package:scube/app/shared/component/text_field/common_text_field.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.read(authProvider.notifier);
    final loginState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 50),
        child: Center(
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
              const SizedBox(height: 80),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 32,
                  ),
                  child: Column(
                    children: [
                      CommonText(
                        text: 'Login',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 20),

                      /// Account Email Input here
                      CommonTextField(
                        controller: loginNotifier.emailController,

                        hintText: AppString.email,
                        validator: OtherHelper.emailValidator,
                      ),

                      SizedBox(height: 20.h),

                      /// Account Password Input here
                      CommonTextField(
                        controller: loginNotifier.passwordController,

                        isPassword: true,
                        hintText: AppString.password,
                        validator: OtherHelper.passwordValidator,
                      ),

                      /// Forget Password Button here
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            //context.goNamed(AppRoutes.forgotPasswordRoute);
                          },
                          child: const CommonText(
                            text: AppString.forgotThePassword,
                            top: 10,
                            bottom: 30,
                            color: AppColors.gray,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      /// Submit Button here
                      CommonButton(
                        titleText: AppString.login,
                        isLoading: loginState.isLoading,
                        onTap: () => loginNotifier.handleLogin(context),
                        isGradient: false,
                      ),
                      const SizedBox(height: 30),
                      const DoNotHaveAccount(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
