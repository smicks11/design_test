import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/utils/colors.dart';

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: 4.h,
      width: isActive ? 12.w : 5.w,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: isActive ? AppColors.black : AppColors.grayscalePlaceholderColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }
}
