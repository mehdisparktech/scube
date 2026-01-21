import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scube/app/core/constants/app_colors.dart';

import '../text/common_text.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.mexLength,
    this.maxLines,
    this.validator,
    this.prefixText,
    this.paddingHorizontal = 16,
    this.paddingVertical = 26,
    this.borderRadius = 10,
    this.inputFormatters,
    this.fillColor = AppColors.background,
    this.hintTextColor = AppColors.textTertiary,
    this.labelTextColor = AppColors.text,
    this.textColor = AppColors.text,
    this.borderColor = AppColors.border,
    this.onSubmitted,
    this.onTap,
    this.suffixIcon,
    this.readOnly = false,
    // Dropdown related parameters
    this.isDropdown = false,
    this.dropdownItems,
    this.onDropdownChanged,
    this.dropdownValue,
    this.onChanged,
  });

  final String? hintText;
  final String? labelText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? textColor;
  final Color borderColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final int? mexLength;
  final int? maxLines;
  final bool isPassword;
  final bool readOnly;

  // Dropdown properties
  final bool isDropdown;
  final List<String>? dropdownItems;
  final Function(String?)? onDropdownChanged;
  final String? dropdownValue;

  int? get effectiveMaxLines {
    if (isPassword) {
      return 1; // Force maxLines to 1 when password field
    }
    return maxLines;
  }

  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    // Automatically set keyboardType to multiline when using newline action with multiline fields
    final effectiveKeyboardType =
        (widget.textInputAction == TextInputAction.newline &&
            widget.maxLines != null &&
            widget.maxLines! > 1)
        ? TextInputType.multiline
        : widget.keyboardType;

    return Container(
      decoration: ShapeDecoration(
        color: widget.fillColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFF0F0F0)),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUnfocus,
        keyboardType: effectiveKeyboardType,
        controller: widget.controller,
        obscureText: obscureText,
        textInputAction: widget.textInputAction,
        maxLength: widget.mexLength,
        maxLines: widget.effectiveMaxLines,
        readOnly: widget.isDropdown ? true : widget.readOnly,
        cursorColor: AppColors.text,
        inputFormatters: widget.inputFormatters,
        style: TextStyle(fontSize: 14, color: widget.textColor),
        onFieldSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        onTap: widget.isDropdown ? _handleDropdownTap : widget.onTap,
        validator: widget.validator,
        decoration: InputDecoration(
          errorMaxLines: 2,
          filled: true,
          prefixIcon: widget.prefixIcon,
          fillColor: widget.fillColor,
          counterText: "",
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.paddingHorizontal.w,
            vertical: widget.paddingVertical.h,
          ),
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(),
          disabledBorder: _buildBorder(),
          errorBorder: _buildBorder(),
          hintText: widget.hintText,
          labelText: widget.labelText,
          hintStyle: GoogleFonts.dmSans(
            fontSize: 14,
            color: widget.hintTextColor,
          ),
          labelStyle: GoogleFonts.dmSans(
            fontSize: 14,
            color: widget.labelTextColor,
          ),
          prefix: CommonText(
            text: widget.prefixText ?? "",
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: widget.isPassword
              ? _buildPasswordSuffixIcon()
              : widget.isDropdown
              ? _buildDropdownIcon()
              : widget.suffixIcon,
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius.r),
      borderSide: BorderSide(color: widget.borderColor),
    );
  }

  Widget _buildPasswordSuffixIcon() {
    return GestureDetector(
      onTap: toggle,
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 10.w),
        child: Icon(
          obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          size: 20.sp,
          color: widget.textColor,
        ),
      ),
    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  // Dropdown related methods
  void _handleDropdownTap() {
    if (widget.isDropdown && widget.dropdownItems != null) {
      _showDropdownMenu();
    }
    // Call the original onTap if provided
    widget.onTap?.call();
  }

  Widget _buildDropdownIcon() {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 10.w),
      child: Icon(
        Icons.arrow_drop_down,
        size: 24.sp,
        color: widget.textColor ?? AppColors.text,
      ),
    );
  }

  void _showDropdownMenu() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(
      Offset.zero,
      ancestor: overlay,
    );

    showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromLTWH(
          offset.dx,
          offset.dy + renderBox.size.height,
          renderBox.size.width,
          renderBox.size.height,
        ),
        Offset.zero & overlay.size,
      ),
      constraints: BoxConstraints(
        minWidth: renderBox.size.width,
        maxWidth: renderBox.size.width,
      ),
      items: widget.dropdownItems!.map((String item) {
        return PopupMenuItem<String>(
          value: item,
          child: Column(
            children: [
              CommonText(
                text: item,
                fontSize: 14,
                color: widget.textColor ?? AppColors.text,
              ),
              Divider(color: AppColors.text, thickness: 1),
            ],
          ),
        );
      }).toList(),
      elevation: 8,
    ).then((String? selectedValue) {
      if (selectedValue != null) {
        // Update the controller text if provided
        widget.controller?.text = selectedValue;
        // Call the onChanged callback
        widget.onDropdownChanged?.call(selectedValue);
      }
    });
  }
}
