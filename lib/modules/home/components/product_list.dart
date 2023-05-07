import 'package:design_test/modules/home/view-model/home_vm.dart';
import 'package:design_test/shared/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/utils/custom_text.dart';
import '../../../shared/widgets/space.dart';
import '../detail.dart';

class ProductList extends StatelessWidget {
  final HomeViewModel model;
  const ProductList({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 15,
            childAspectRatio: 0.65,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => InkWell(
              onTap: () {
                // Navigator.pushNamed(context, Routes.detailsRoute);
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const DetailScreem(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var curve = Curves.easeIn;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image(
                        image: AssetImage(model.productList[index].image),
                        height: 130.h,
                        width: deviceWidth(context) * 1.0,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: model.productList[index].likeStatus == true
                              ? const Icon(
                                  Icons.favorite,
                                  color: Color.fromARGB(255, 243, 95, 92),
                                  size: 19,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  size: 19,
                                ))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HSpace(14.h),
                        Styles.medium(model.productList[index].category,
                            color: AppColors.grayscalePlaceholderColor),
                        HSpace(10.h),
                        Styles.medium(model.productList[index].productName,
                            color: AppColors.black,
                            fontSize: 14.sp,
                            overflow: TextOverflow.ellipsis,
                            lines: 2),
                        HSpace(18.h),
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.0.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 15.sp,
                                      color: Colors.orange,
                                    ),
                                    WSpace(4.w),
                                    Styles.regular(
                                        '${model.productList[index].rating} |',
                                        fontSize: 11.sp,
                                        color: AppColors
                                            .grayscalePlaceholderColor),
                                    WSpace(4.w),
                                    Styles.regular(
                                        model.productList[index].numOfLikes,
                                        fontSize: 11.sp,
                                        color: AppColors
                                            .grayscalePlaceholderColor),
                                  ],
                                ),
                              ),
                              Styles.bold('\$${model.productList[index].price}',
                                  color: Colors.green, fontSize: 17.sp)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            childCount: model.productList.length,
          )),
    );
  }
}
