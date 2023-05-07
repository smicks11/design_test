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

SliverAppBar header(BuildContext context, HomeViewModel model) {
  return SliverAppBar(
    leadingWidth: deviceWidth(context) * 0.6,
    leading: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomTextFormField(
        prefixIcon: SvgPicture.asset(SvgAssets.search),
        hintText: 'Search..',
        isEnabled: false,
      ),
    ),
    actions: const [
      ActionItem(
        icon: SvgAssets.voucher,
        count: '1',
      ),
      ActionItem(
        icon: SvgAssets.voucher,
        count: '9+',
      )
    ],
    floating: true,
    snap: true,
    pinned: true,
    expandedHeight: 300.h,
    flexibleSpace: PageView.builder(
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
  );
}
