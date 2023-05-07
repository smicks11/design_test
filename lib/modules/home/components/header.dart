import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/utils/assets.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/utils/custom_text.dart';
import '../../../shared/utils/utilities.dart';
import '../../../shared/widgets/custom_textfield.dart';
import '../../../shared/widgets/space.dart';
import '../view-model/home_vm.dart';
import 'action_item.dart';
import 'indicator.dart';

SliverAppBar header(HomeViewModel model, BuildContext context) {
  return SliverAppBar(
    expandedHeight: 300.h,
    flexibleSpace: FlexibleSpaceBar(
      background: PageView.builder(
        itemCount: model.images.length,
        onPageChanged: (index) {
          model.getCurrentIndex(index);
        },
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(model.banners[index].images),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HSpace(60.h),
                Row(
                  children: [
                    Expanded(
                      child: Styles.medium(model.banners[index].hashTag,
                          color: AppColors.black, fontSize: 11.sp),
                    ),
                    Row(
                      children: List.generate(
                        model.banners.length,
                        (index) => Indicator(
                          isActive: index == model.currentPage,
                        ),
                      ),
                    ),
                  ],
                ),
                HSpace(12.h),
                Styles.bold(model.banners[index].headerText,
                    fontSize: 35.sp, color: AppColors.black),
                HSpace(12.h),
                Styles.regular(model.banners[index].body, fontSize: 12.sp),
                HSpace(22.h),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Styles.regular('Check this out',
                      fontSize: 12.sp, color: AppColors.white),
                )
              ],
            ),
          );
        },
      ),
    ),
    backgroundColor: Colors.white,
    leadingWidth: deviceWidth(context) * 0.65,
    toolbarHeight: 70,
    leading: Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomTextFormField(
        prefixIcon: SvgPicture.asset(SvgAssets.search),
        hintText: 'Search..',
        isEnabled: false,
      ),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: ActionItem(
          icon: SvgAssets.voucher,
          count: '1',
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: ActionItem(
          icon: SvgAssets.voucher,
          count: '9+',
        ),
      )
    ],
    floating: true,
    elevation: 0,
    titleSpacing: 0,
    pinned: true,
    snap: true,
  );
}
