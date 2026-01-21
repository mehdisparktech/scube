import 'package:flutter/material.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_string.dart';

class OtherHelper {
  static RegExp emailRegexp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  static RegExp passRegExp = RegExp(r'(?=.*[a-z])(?=.*[0-9])');

  static String? validator(value) {
    if (value.isEmpty) {
      return AppString.thisFieldIsRequired;
    }
    return null;
  }

  static String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return AppString.thisFieldIsRequired;
    } else if (!emailRegexp.hasMatch(value)) {
      return AppString.enterValidEmail;
    }
    return null;
  }

  static String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return AppString.thisFieldIsRequired;
    } else if (value.length < 8) {
      return AppString.passwordMustBeeEightCharacters;
    } else if (!passRegExp.hasMatch(value)) {
      return AppString.passwordMustBeeEightCharacters;
    }
    return null;
  }

  static String? confirmPasswordValidator(
    value,
    TextEditingController passwordController,
  ) {
    if (value == null || value.isEmpty) {
      return AppString.thisFieldIsRequired;
    } else if (value != passwordController.text) {
      return AppString.thePasswordDoesNotMatch;
    }
    return null;
  }

  static Future<DateTime?> showDatePickerDialog(BuildContext context) async {
    return await showDatePicker(
      context: context,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primary,
            onPrimary: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        child: child!,
      ),
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
  }

  static Future<String> openDatePickerDialog(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final DateTime? picked = await showDatePickerDialog(context);

    if (picked != null) {
      controller.text = "${picked.year}/${picked.month}/${picked.day}";
      return picked.toIso8601String();
    }
    return "";
  }

  static Future<TimeOfDay?> showTimePickerDialog(
    BuildContext context, {
    TextEditingController? controller,
  }) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final String formattedTime = formatTime(picked);
      controller?.text = formattedTime;
      return picked;
    }
    return null;
  }

  static String formatTime(TimeOfDay time) {
    return "${time.hour > 12 ? (time.hour - 12).toString().padLeft(2, '0') : (time.hour == 0 ? 12 : time.hour).toString().padLeft(2, '0')}:"
        "${time.minute.toString().padLeft(2, '0')} ${time.hour >= 12 ? "PM" : "AM"}";
  }
}
