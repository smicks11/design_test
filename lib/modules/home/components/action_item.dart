import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/utils/custom_text.dart';

class ActionItem extends StatelessWidget {
  final String icon;
  final String count;
  const ActionItem({
    super.key,
    required this.icon,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Row(
          children: [
            const Icon(
              Icons.wallet_giftcard_outlined,
              color: Colors.black54,
              size: 22,
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 24.0.h,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 22.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 95, 92),
                      borderRadius: BorderRadius.circular(6.r)),
                  child: Center(
                    child: Styles.medium(count,
                        color: AppColors.white, fontSize: 9.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
