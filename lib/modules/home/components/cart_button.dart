import 'package:design_test/shared/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/utils/colors.dart';
import '../../../shared/widgets/space.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r))),
          child: Row(
            children: [
              Icon(
                Icons.gif_box_outlined,
                color: AppColors.white,
                size: 22.sp,
              ),
              WSpace(10.w),
              Styles.medium('1', color: AppColors.white, fontSize: 18.sp)
            ],
          ),
        ),
        Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 28.w),
          decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r))),
          child:
              Styles.medium('Buy Now', color: AppColors.white, fontSize: 14.sp),
        ),
      ],
    );
  }
}
