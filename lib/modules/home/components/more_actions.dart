import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/utils/colors.dart';
import '../../../shared/utils/custom_text.dart';
import '../../../shared/utils/utilities.dart';
import '../../../shared/widgets/space.dart';
import '../view-model/home_vm.dart';
import 'indicator.dart';

SliverToBoxAdapter moreActions(BuildContext context, HomeViewModel model) {
  return SliverToBoxAdapter(
    child: Container(
        margin: EdgeInsets.only(top: 18.h),
        height: 120.h,
        decoration: const BoxDecoration(color: AppColors.white),
        child: Column(children: [
          SizedBox(
            height: 70.h,
            width: deviceWidth(context) * 1.0,
            child: PageView.builder(
              itemCount: 3,
              onPageChanged: (index) {
                model.getCurrentCategoryIndex(index);
              },
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(model.categoryIcon.length, (index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.r),
                              color: const Color.fromARGB(255, 236, 240, 243)),
                          child: SvgPicture.asset(
                            model.categoryIcon[index].icon,
                            height: 18.h,
                            width: 18.w,
                          ),
                        ),
                        HSpace(14.h),
                        Styles.regular(
                            model.categoryIcon[index].iconPlaceHolder,
                            fontSize: 12.sp)
                      ],
                    );
                  }),
                );
              },
            ),
          ),
          HSpace(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Indicator(
                isActive: index == model.currentCategoryPage,
              ),
            ),
          ),
        ])),
  );
}
