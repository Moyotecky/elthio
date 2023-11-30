import '../doctor_detail_screen/widgets/am_item_widget.dart';
import 'controller/doctor_detail_controller.dart';
import 'models/am_item_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/widgets/app_bar/appbar_leading_image.dart';
import 'package:healhio/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:healhio/widgets/app_bar/appbar_trailing_image.dart';
import 'package:healhio/widgets/app_bar/custom_app_bar.dart';
import 'package:healhio/widgets/custom_elevated_button.dart';
import 'package:healhio/widgets/custom_icon_button.dart';
import 'package:readmore/readmore.dart';

class DoctorDetailScreen extends GetWidget<DoctorDetailController> {
  const DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.v),
                child: Column(children: [
                  _buildDoctorInformation(),
                  SizedBox(height: 31.v),
                  _buildDateTime(),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildNinetyFour()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl_details".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.symmetric(horizontal: 16.h),
              onTap: () {
                onTapOverflowMenu();
              })
        ]);
  }

  /// Section Widget
  Widget _buildDoctorInformation() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 41.h),
          child: Row(children: [
            CustomImageView(
                imagePath: ImageConstant.imgRectangle959,
                height: 111.adaptSize,
                width: 111.adaptSize,
                radius: BorderRadius.circular(8.h)),
            Padding(
                padding: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 5.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("msg_dr_marcus_horizon".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 8.v),
                      Text("lbl_chardiologist".tr,
                          style: theme.textTheme.labelLarge),
                      SizedBox(height: 8.v),
                      Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgStar,
                            height: 16.adaptSize,
                            width: 16.adaptSize),
                        Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text("lbl_4_7".tr,
                                style: CustomTextStyles.labelLargeAmber500))
                      ]),
                      SizedBox(height: 11.v),
                      Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgLocation,
                            height: 13.adaptSize,
                            width: 13.adaptSize,
                            margin: EdgeInsets.only(bottom: 2.v)),
                        Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: Text("lbl_800m_away".tr,
                                style: theme.textTheme.labelLarge))
                      ])
                    ]))
          ])),
      SizedBox(height: 17.v),
      Text("lbl_about".tr, style: CustomTextStyles.titleMedium16),
      SizedBox(height: 8.v),
      SizedBox(
          width: 305.h,
          child: ReadMoreText("msg_lorem_ipsum_dolor".tr,
              trimLines: 3,
              colorClickableText: theme.colorScheme.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: "lbl_read_more".tr,
              moreStyle:
                  CustomTextStyles.bodySmallGray600.copyWith(height: 1.50),
              lessStyle:
                  CustomTextStyles.bodySmallGray600.copyWith(height: 1.50)))
    ]);
  }

  /// Section Widget
  Widget _buildDateTime() {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildThirtyOne(dayLabel: "lbl_mon".tr, numberLabel: "lbl_21".tr),
        Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: _buildThirtyOne(
                dayLabel: "lbl_tue".tr, numberLabel: "lbl_22".tr)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: _buildThirtyOne(
                dayLabel: "lbl_wed".tr, numberLabel: "lbl_23".tr)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: _buildThirtyOne(
                dayLabel: "lbl_thu".tr, numberLabel: "lbl_24".tr)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: _buildThirtyOne(
                dayLabel: "lbl_fri".tr, numberLabel: "lbl_25".tr)),
        Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: _buildThirtyOne(
                dayLabel: "lbl_sat".tr, numberLabel: "lbl_26".tr))
      ]),
      SizedBox(height: 32.v),
      Divider(),
      SizedBox(height: 32.v),
      Obx(() => Wrap(
          runSpacing: 9.v,
          spacing: 9.h,
          children: List<Widget>.generate(
              controller.doctorDetailModelObj.value.amItemList.value.length,
              (index) {
            AmItemModel model =
                controller.doctorDetailModelObj.value.amItemList.value[index];
            return AmItemWidget(model);
          })))
    ]);
  }

  /// Section Widget
  Widget _buildNinetyFour() {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 28.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 50.adaptSize,
              width: 50.adaptSize,
              padding: EdgeInsets.all(13.h),
              decoration: IconButtonStyleHelper.fillOnErrorContainer,
              child: CustomImageView(imagePath: ImageConstant.imgMusicPrimary)),
          Expanded(
              child: CustomElevatedButton(
                  height: 50.v,
                  text: "lbl_book_apointment".tr,
                  margin: EdgeInsets.only(left: 16.h),
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700_1,
                  onPressed: () {
                    onTapBookApointment();
                  }))
        ]));
  }

  /// Common widget
  Widget _buildThirtyOne({
    required String dayLabel,
    required String numberLabel,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 9.v),
        decoration: AppDecoration.outlineGray300
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 5.v),
              Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(dayLabel,
                      style: theme.textTheme.labelMedium!
                          .copyWith(color: appTheme.gray500))),
              SizedBox(height: 4.v),
              Text(numberLabel,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: theme.colorScheme.onPrimary))
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapOverflowMenu() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  /// Navigates to the bookingDoctorScreen when the action is triggered.
  onTapBookApointment() {
    Get.toNamed(
      AppRoutes.bookingDoctorScreen,
    );
  }
}
