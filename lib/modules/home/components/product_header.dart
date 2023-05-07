import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/utils/custom_text.dart';
import '../../../shared/widgets/space.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.grayscaleInputColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            HSpace(25.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Styles.medium('Best Sale Product',
                  color: AppColors.black, fontSize: 20.sp),
              Styles.medium('See more',
                  color: AppColors.primaryColor, fontSize: 14.sp)
            ])
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

SliverPersistentHeader productHeader() {
  return SliverPersistentHeader(
    pinned: true,
    delegate: HeaderDelegate(),
  );
}
