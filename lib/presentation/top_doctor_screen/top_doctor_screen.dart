import '../top_doctor_screen/widgets/topdoctor_item_widget.dart';
import 'controller/top_doctor_controller.dart';
import 'models/topdoctor_item_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/widgets/app_bar/appbar_leading_image.dart';
import 'package:healhio/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:healhio/widgets/app_bar/appbar_trailing_image.dart';
import 'package:healhio/widgets/app_bar/custom_app_bar.dart';

class TopDoctorScreen extends GetWidget<TopDoctorController> {
  const TopDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Padding(
                padding: EdgeInsets.only(left: 24.h, top: 24.v, right: 24.h),
                child: Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16.v);
                    },
                    itemCount: controller
                        .topDoctorModelObj.value.topdoctorItemList.value.length,
                    itemBuilder: (context, index) {
                      TopdoctorItemModel model = controller.topDoctorModelObj
                          .value.topdoctorItemList.value[index];
                      return TopdoctorItemWidget(model);
                    })))));
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
        title: AppbarSubtitleTwo(text: "lbl_top_doctor".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.symmetric(horizontal: 16.h))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
