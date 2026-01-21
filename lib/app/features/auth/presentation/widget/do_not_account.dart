import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scube/app/route/app_routes.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_string.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppString.doNotHaveAccount,
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.textTertiary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),

          /// Sign Up Button here
          TextSpan(
            text: AppString.register,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppRoutes.goToSignup(context);
              },
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
