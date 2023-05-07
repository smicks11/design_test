// ignore_for_file: deprecated_member_use

import 'package:design_test/shared/utils/assets.dart';
import 'package:design_test/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../app/bottom_navigation.dart';

class BottomNav extends StatelessWidget {
  final bool? showProviderProfile;

  const BottomNav({Key? key, this.showProviderProfile}) : super(key: key);
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavModel>(builder: (context, model, child) {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: AppColors.white,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2.r,
                  blurRadius: 2.r,
                  offset: const Offset(0, 0.75),
                ),
              ],
            ),
            child: BottomNavigationBar(
                onTap: (index) => model.updateIndex(index),
                type: BottomNavigationBarType.fixed,
                elevation: 10.h,
                selectedItemColor: AppColors.black,
                selectedLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
                unselectedLabelStyle: TextStyle(
                    color: AppColors.grayscalePlaceholderColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
                backgroundColor: AppColors.white,
                currentIndex: model.currentIndex,
                items: userBottomTabItems(context)),
          ),
          body: SafeArea(
              child: IndexedStack(
                  index: model.currentIndex, children: model.children)),
        ),
      );
    });
  }

  userBottomTabItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
        activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 3.0.h),
          child: Padding(
            padding: EdgeInsets.only(bottom: 3.0.h),
            child: SvgPicture.asset(
              SvgAssets.home,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        icon: Padding(
          padding: EdgeInsets.only(bottom: 3.0.h),
          child: SvgPicture.asset(
            SvgAssets.home,
          ),
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
        activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 3.0.h),
          child: SvgPicture.asset(
            SvgAssets.voucher,
            color: AppColors.primaryColor,
          ),
        ),
        icon: Padding(
          padding: EdgeInsets.only(bottom: 3.0.h),
          child: SvgPicture.asset(
            SvgAssets.voucher,
          ),
        ),
        label: "Voucher",
      ),
      BottomNavigationBarItem(
        activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 3.0.h),
          child: SvgPicture.asset(
            SvgAssets.wallet,
            color: AppColors.primaryColor,
          ),
        ),
        icon: Padding(
          padding: EdgeInsets.only(bottom: 3.0.h),
          child: SvgPicture.asset(
            SvgAssets.wallet,
          ),
        ),
        label: "Wallet",
      ),
      BottomNavigationBarItem(
        activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 3.0.h),
          child: SvgPicture.asset(
            SvgAssets.settings,
            color: AppColors.primaryColor,
          ),
        ),
        icon: Padding(
          padding: EdgeInsets.only(bottom: 3.0.h),
          child: SvgPicture.asset(
            SvgAssets.settings,
          ),
        ),
        label: "Settings",
      ),
    ];
  }
}
