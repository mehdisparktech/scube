import 'package:flutter/material.dart';
import 'package:scube/app/core/constants/app_colors.dart';

import '../other/common_loader.dart';
import '../text/common_text.dart';

class CommonButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String titleText;
  final Color titleColor;
  final Color buttonColor;
  final Color? borderColor;
  final double borderWidth;
  final double titleSize;
  final FontWeight titleWeight;
  final double buttonRadius;
  final double buttonHeight;
  final double buttonWidth;
  final bool isLoading;
  final bool isGradient;

  const CommonButton({
    this.onTap,
    required this.titleText,
    this.titleColor = AppColors.white,
    this.buttonColor = AppColors.primary,
    this.titleSize = 18,
    this.buttonRadius = 14,
    this.titleWeight = FontWeight.w700,
    this.buttonHeight = 60,
    this.borderWidth = 1,
    this.isLoading = false,
    this.buttonWidth = double.infinity,
    this.borderColor = AppColors.primary,
    this.isGradient = true,
    super.key,
  });

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 100),
          lowerBound: 0.0,
          upperBound: 0.15,
        )..addListener(() {
          setState(() {});
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonHeight,
      width: widget.buttonWidth,
      child: _buildElevatedButton(),
    );
  }

  // Function to build the button with common settings
  Widget _buildElevatedButton() {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: (1 - _animationController.value).toDouble(),
        child: Container(
          decoration: BoxDecoration(
            color: widget.buttonColor,
            gradient: widget.isGradient
                ? const LinearGradient(
                    begin: Alignment(0.97, 1.00),
                    end: Alignment(0.08, 0.04),
                    colors: [Color(0xFFEC526A), Color(0xFFF77F6E)],
                  )
                : null,
            borderRadius: BorderRadius.circular(widget.buttonRadius),
            border: Border.all(
              color: widget.isGradient
                  ? Colors.transparent
                  : widget.borderColor ?? Colors.transparent,
              width: widget.borderWidth,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(widget.buttonRadius),
              onTap: widget.onTap,
              child: Container(
                height: widget.buttonHeight,
                width: widget.buttonWidth,
                alignment: Alignment.center,
                child: widget.isLoading ? _buildLoader() : _buildText(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return CommonLoader(size: widget.buttonHeight - 12);
  }

  Widget _buildText() {
    return CommonText(
      text: widget.titleText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      fontSize: widget.titleSize,
      color: widget.titleColor,
      fontWeight: widget.titleWeight,
    );
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onTap == null) return;
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onTap == null) return;
    _animationController.reverse();
  }

  void _onTapCancel() {
    if (widget.onTap == null) return;
    _animationController.reverse();
  }
}
