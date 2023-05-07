// ignore_for_file: non_constant_identifier_names

import 'package:design_test/shared/utils/custom_text.dart';
import 'package:design_test/shared/utils/utilities.dart';
import 'package:design_test/shared/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/base/base_view.dart';
import '../../shared/utils/assets.dart';
import '../../shared/utils/colors.dart';
import 'components/action_item.dart';
import 'components/cart_button.dart';
import 'view-model/home_vm.dart';

class DetailScreem extends StatefulWidget {
  const DetailScreem({super.key});

  @override
  State<DetailScreem> createState() => _DetailScreemState();
}

class _DetailScreemState extends State<DetailScreem>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(ImageAssets.product_one_detail), context);

    return BaseView<HomeViewModel>(
      vmBuilder: (context) => HomeViewModel(
        context: context,
      ),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, HomeViewModel model) => Scaffold(
        appBar: _buildAppBar(context, model),
        body: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 1000),
            builder: (BuildContext context, double value, Widget? child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, (1 - value) * 100),
                  child: SizedBox(
                    height: deviceHeight(context) * 1.0,
                    width: deviceWidth(context) * 1.0,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HSpace(20.h),
                          imageBanner(context, model),
                          HSpace(20.h),
                          _productOwner(),
                          HSpace(12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Styles.medium(
                              "Essentials Men's Short-Sleeve Crewnect T-Shirt",
                              color: AppColors.black,
                              fontSize: 20.sp,
                            ),
                          ),
                          HSpace(16.h),
                          _rateAndReviewSection(),
                          HSpace(20.h),
                          _tabSection(context),
                          HSpace(4.h),
                          SizedBox(
                            height: 130.h,
                            child: TabBarView(
                                controller: tabController,
                                children: [
                                  _aboutItemBlock(model),
                                  _aboutItemBlock(model),
                                ]),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: const Divider(
                              color: AppColors.grayscalePlaceholderColor,
                            ),
                          ),
                          HSpace(30.h),
                          description(),
                          HSpace(25.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Styles.regular(
                                'Chat us if there is anything you need to ask about the product :)',
                                color: AppColors.grayscalePlaceholderColor,
                                fontSize: 14.sp),
                          ),
                          HSpace(30.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: const Divider(
                              color: AppColors.grayscalePlaceholderColor,
                            ),
                          ),
                          HSpace(30.h),
                          ShippingSection(),
                          HSpace(30.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: const Divider(
                              color: AppColors.grayscalePlaceholderColor,
                            ),
                          ),
                          HSpace(30.h),
                          _sellerInfo(),
                          HSpace(30.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: const Divider(
                              color: AppColors.grayscalePlaceholderColor,
                            ),
                          ),
                          HSpace(30.h),
                          _reviewSection(),
                          HSpace(30.h),
                          _reviewSecondSection(model),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: const Divider(
                              color: AppColors.grayscalePlaceholderColor,
                            ),
                          ),
                          HSpace(30.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              children: [
                                _reviewHeaderSection(model),
                                HSpace(30.h),
                                Column(
                                  children: List.generate(
                                      4,
                                      (index) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            child: commentSection(),
                                          )),
                                )
                              ],
                            ),
                          ),
                          HSpace(30.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Styles.medium('Recommendation',
                                    color: AppColors.black, fontSize: 17.sp),
                                Styles.medium('See more',
                                    color: AppColors.primaryColor,
                                    fontSize: 15.sp)
                              ],
                            ),
                          ),
                          HSpace(30.h),
                          _productBlock(model, context)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
        bottomNavigationBar: _bottomNav(context),
      );






  Padding _productBlock(HomeViewModel model, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 15,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (_, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(model.productList[index].image),
                  height: 130.h,
                  width: deviceWidth(context) * 1.0,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  // decoration: const BoxDecoration(color: AppColors.white),
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
                                      color:
                                          AppColors.grayscalePlaceholderColor),
                                  WSpace(4.w),
                                  Styles.regular(
                                      model.productList[index].numOfLikes,
                                      fontSize: 11.sp,
                                      color:
                                          AppColors.grayscalePlaceholderColor),
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
            );
          }),
    );
  }

  Padding ShippingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.medium('Shippings Information:',
              color: AppColors.black, fontSize: 17.sp),
          HSpace(22.h),
          shipping(
              header: "Delivery:", body: 'Shipping from Jakarta Indonesia'),
          shipping(header: "Shipping:", body: 'FREE International Shipping'),
          shipping(
              header: "Arrive:", body: 'Estimated arrival on 25 - 27 Oct 2022'),
        ],
      ),
    );
  }

  Column commentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(ImageAssets.product_two),
                ),
                WSpace(12.w),
                Styles.medium('Eren Y***r',
                    color: AppColors.black, fontSize: 14.sp)
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                  size: 20.sp,
                ),
                WSpace(12.w),
                Styles.medium('5.0', color: AppColors.black, fontSize: 18.sp),
                WSpace(12.w),
                const Icon(
                  Icons.more_horiz_outlined,
                  color: AppColors.grayscalePlaceholderColor,
                  size: 16,
                )
              ],
            )
          ],
        ),
        HSpace(20.h),
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 5,
              mainAxisSpacing: 12.0,
            ),
            itemCount: 3,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.only(right: 12),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.primaryColor, width: 0.9),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green[100]!.withOpacity(0.3)),
                child: Styles.regular('Fast Response',
                    fontSize: 11.sp, color: AppColors.primaryColor),
              );
            }),
        HSpace(26.h),
        Styles.regular(
            'According to my expectations, This is the best product, Thank You',
            color: AppColors.black,
            fontSize: 14.sp),
        HSpace(26.h),
        Row(
          children: [
            const Icon(
              Icons.thumb_up,
              color: AppColors.primaryColor,
              size: 22,
            ),
            WSpace(12.w),
            Expanded(
                child: Styles.medium('Helpful ?',
                    color: AppColors.primaryColor, fontSize: 14.sp)),
            Styles.regular('Yesterdays',
                color: AppColors.grayscalePlaceholderColor, fontSize: 13.sp)
          ],
        ),
        HSpace(30.h),
        const Divider(
          color: AppColors.grayscalePlaceholderColor,
        ),
      ],
    );
  }

  Row _reviewHeaderSection(HomeViewModel model) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.medium('Top Reviews',
                  color: AppColors.black, fontSize: 17.sp),
              HSpace(20.h),
              Styles.regular('Showing 3 of 2.3k+ reviews',
                  color: AppColors.grayscalePlaceholderColor, fontSize: 14.sp)
            ],
          ),
        ),
        WSpace(40.w),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.grayscalePlaceholderColor, width: 0.7),
                color: AppColors.grayscaleInputColor,
                borderRadius: BorderRadius.circular(8.r)),
            height: 56.h,
            width: 120.w,
            child: DropdownButtonHideUnderline(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.h),
                child: DropdownButton<String>(
                  icon: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 16.h),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 15.sp,
                      )),
                  isExpanded: true,
                  style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      fontFamily: 'OpenSans'),
                  items: model.dropdownList.map((e) {
                    return DropdownMenuItem(
                        value: e,
                        onTap: () async {
                          model.setDropDownItem(e.toString());
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child:
                                Styles.regular(e.toString(), fontSize: 13.sp)));
                  }).toList(),
                  onChanged: (String? value) {
                    // print(value);
                  },
                  hint: Styles.medium(model.selectedItem ?? 'Popular',
                      fontSize: 11.sp, color: AppColors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding _reviewSecondSection(HomeViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.medium('Reviews with images & videos',
              color: AppColors.black, fontSize: 17.sp),
          HSpace(20.h),
          Row(
            children: List.generate(
              model.imageDetails.length,
              (index) => Container(
                margin: EdgeInsets.only(right: 8.h),
                height: 75.h,
                width: 75.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                        image:
                            AssetImage(model.imageDetails[index].previewImage),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          HSpace(30.h),
        ],
      ),
    );
  }

  Padding _sellerInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.medium('Seller Information:',
              color: AppColors.black, fontSize: 17.sp),
          HSpace(22.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: AppColors.grayscaleInputColor,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.white, width: 3.0),
                          color: AppColors.grayscalePlaceholderColor,
                        ),
                      ))
                ],
              ),
              WSpace(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Styles.medium('Thrifting_Store',
                        color: AppColors.black, fontSize: 19.sp),
                    HSpace(12.h),
                    Styles.regular('Active 5 Min ago | 96.7% Positive Feedback',
                        fontSize: 12.sp),
                    HSpace(16.h),
                    Container(
                      width: 140.w,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1.0,
                            color: AppColors.primaryColor,
                          )),
                      child: Row(
                        children: [
                          Icon(
                            Icons.card_giftcard_outlined,
                            color: AppColors.primaryColor,
                            size: 13.sp,
                          ),
                          WSpace(6.w),
                          Styles.medium('Visit Store',
                              fontSize: 14.sp, color: AppColors.primaryColor)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Padding _reviewSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.medium('Reviews & Ratings',
              color: AppColors.black, fontSize: 17.sp),
          HSpace(22.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Styles.bold('4.9',
                          color: AppColors.black, fontSize: 40.sp),
                      Styles.bold('/ 5.0',
                          color: AppColors.grayscalePlaceholderColor,
                          fontSize: 13.sp),
                    ],
                  ),
                  HSpace(20.h),
                  Row(
                    children: List.generate(
                        5,
                        (index) => const Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: 20,
                            )),
                  ),
                  HSpace(30.h),
                  Styles.regular('2.3k+ Reviews',
                      fontSize: 14.sp,
                      color: AppColors.grayscalePlaceholderColor)
                ],
              ),
              WSpace(20.w),
              Expanded(
                child: Column(
                  children: [
                    _reviewPoll(
                        reviewNum: '1.5k', reviewValue: 0.8, reviewRate: "5"),
                    _reviewPoll(
                        reviewNum: '710', reviewValue: 0.6, reviewRate: "4"),
                    _reviewPoll(
                        reviewNum: '140', reviewValue: 0.4, reviewRate: "3"),
                    _reviewPoll(
                        reviewNum: '10', reviewValue: 0.2, reviewRate: "2"),
                    _reviewPoll(
                        reviewNum: '4', reviewValue: 0.1, reviewRate: "1"),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Padding _reviewPoll(
      {required double reviewValue,
      required String reviewRate,
      required String reviewNum}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.orangeAccent,
            size: 20,
          ),
          WSpace(10.h),
          Styles.regular(reviewRate,
              color: AppColors.grayscalePlaceholderColor, fontSize: 14.sp),
          WSpace(10.h),
          Container(
            height: 10,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 1, color: AppColors.grayscalePlaceholderColor),
            ),
            child: LinearProgressIndicator(
              value: reviewValue,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              backgroundColor: AppColors.grayscalePlaceholderColor,
            ),
          ),
          WSpace(10.h),
          Styles.medium(reviewNum, color: AppColors.black, fontSize: 14.sp),
        ],
      ),
    );
  }

  Padding shipping({required String header, required String body}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Styles.regular(header,
              fontSize: 14.sp, color: AppColors.grayscalePlaceholderColor),
          WSpace(8.w),
          Styles.medium(body, fontSize: 14.sp, color: AppColors.black),
        ],
      ),
    );
  }

  Padding description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.medium('Description:',
              color: AppColors.black, fontSize: 17.sp),
          HSpace(17.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: List.generate(
                  5,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.fiber_manual_record,
                              size: 6,
                              color: AppColors.grayscalePlaceholderColor,
                            ),
                            WSpace(8.w),
                            Styles.regular('Durable Combination Cotton Fabric',
                                fontSize: 14.sp,
                                color: AppColors.grayscalePlaceholderColor),
                          ],
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }

  Container _bottomNav(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      height: deviceHeight(context) * 0.15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.regular('Total Price',
                    color: AppColors.grayscalePlaceholderColor,
                    fontSize: 14.sp),
                HSpace(10.h),
                Styles.medium('\$18.00',
                    fontSize: 22.sp, color: AppColors.primaryColor)
              ],
            ),
          ),
          const CartButton()
        ],
      ),
    );
  }

  Padding _productOwner() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Icon(
            Icons.wallet_giftcard,
            color: AppColors.grayscalePlaceholderColor,
            size: 15.sp,
          ),
          WSpace(10.w),
          Styles.regular('tokobaju.id',
              color: AppColors.grayscalePlaceholderColor, fontSize: 14.sp),
        ],
      ),
    );
  }

  Padding _tabSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                  color: AppColors.grayscalePlaceholderColor, width: 0.3),
            )),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: deviceWidth(context) * 0.7.w,
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              controller: tabController,
              indicatorColor: AppColors.primaryColor,
              labelColor: AppColors.primaryColor,
              labelStyle: TextStyle(fontSize: 15.sp),
              unselectedLabelColor: AppColors.grayscalePlaceholderColor,
              indicatorWeight: 2.5,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  text: 'About Item',
                ),
                Tab(
                  text: 'Reviews',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _aboutItemBlock(HomeViewModel model) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        decoration: const BoxDecoration(
            // color: AppColors.grayscaleInputColor
            ),
        child: Column(
          children: List.generate(
            model.body.length,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: _aboutContent(
                  header1: model.body[index].headerText,
                  body1: model.body[index].body,
                  header2: model.body[index].headerText2,
                  body2: model.body[index].body2),
            ),
          ),
        ));
  }

  Row _aboutContent(
      {required String header1,
      required String body1,
      required String header2,
      required String body2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Styles.regular(header1,
                  color: AppColors.grayscalePlaceholderColor, fontSize: 14.sp),
              WSpace(20.w),
              Styles.medium(body1, color: AppColors.black, fontSize: 14.sp),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Styles.regular(header2,
                  color: AppColors.grayscalePlaceholderColor, fontSize: 14.sp),
              WSpace(20.w),
              Styles.medium(body2, color: AppColors.black, fontSize: 14.sp),
            ],
          ),
        ),
      ],
    );
  }

  Padding _rateAndReviewSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Icon(
              Icons.star,
              size: 20.sp,
              color: Colors.orange,
            ),
            WSpace(6.w),
            Styles.regular('4.9 Ratings',
                fontSize: 14.sp, color: AppColors.grayscalePlaceholderColor),
          ]),
          WSpace(4.w),
          Styles.bold('.',
              fontSize: 14.sp, color: AppColors.grayscalePlaceholderColor),
          WSpace(4.w),
          Styles.regular('2.3k+ Reviews',
              fontSize: 14.sp, color: AppColors.grayscalePlaceholderColor),
          WSpace(4.w),
          Styles.bold('.',
              fontSize: 14.sp, color: AppColors.grayscalePlaceholderColor),
          WSpace(4.w),
          Styles.regular('2.9k+ Sold',
              fontSize: 14.sp, color: AppColors.grayscalePlaceholderColor),
          WSpace(4.w),
        ],
      ),
    );
  }

  Container imageBanner(BuildContext context, HomeViewModel model) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
      height: deviceHeight(context) * 0.38,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.grayscaleInputColor,
          borderRadius: BorderRadius.circular(6.r)),
      child: Row(
        children: [
          Column(
              children: List.generate(
                  model.imageDetail.length,
                  (index) => InkWell(
                        onTap: () {
                          model.getSelectedImage(
                              model.imageDetail[index].actualImage, index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 14.h),
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              image: DecorationImage(
                                  image: AssetImage(
                                      model.imageDetail[index].previewImage),
                                  fit: BoxFit.cover)),
                        ),
                      ))),
          WSpace(30.w),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: AnimatedContainer(
                height: 350,
                duration: const Duration(milliseconds: 500),
                transform: model.selectedIndex == 1
                    ? Matrix4.rotationX(0.5)
                    : model.selectedIndex == 2
                        ? Matrix4.rotationZ(0)
                        : model.selectedIndex == 3
                            ? Matrix4.rotationY(1)
                            : Matrix4.rotationZ(0),
                child: Image.asset(
                  model.selectedImage ?? model.imageDetail[0].actualImage,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context, HomeViewModel model) {
  return AppBar(
    automaticallyImplyLeading: true,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 20.sp,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      color: Colors.black54,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 28.0),
        child: InkWell(
          onTap: () {
            model.likeProduct();
          },
          child: Icon(
            model.likeState == true ? Icons.favorite : Icons.favorite_border,
            color: model.likeState == true
                ? const Color.fromARGB(255, 229, 37, 101)
                : Colors.black,
            size: 22.sp,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 28.0),
        child: Icon(
          Icons.share_outlined,
          color: AppColors.black,
          size: 22.sp,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: ActionItem(
          icon: SvgAssets.voucher,
          count: '1',
        ),
      ),
    ],
  );
}
