import '../controller/schedule_controller.dart';
import '../models/schedule_item_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class ScheduleItemWidget extends StatelessWidget {
  ScheduleItemWidget(
    this.scheduleItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ScheduleItemModel scheduleItemModelObj;

  var controller = Get.find<ScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          scheduleItemModelObj.drMarcusHorizon!.value,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 4.v),
                      Obx(
                        () => Text(
                          scheduleItemModelObj.chardiologist!.value,
                          style: CustomTextStyles.labelLargeBluegray400,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => CustomImageView(
                    imagePath: scheduleItemModelObj.drMarcusHorizon1!.value,
                    height: 46.adaptSize,
                    width: 46.adaptSize,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.v),
          Padding(
            padding: EdgeInsets.only(right: 47.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCalendarBlueGray700,
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Obx(
                    () => Text(
                      scheduleItemModelObj.date!.value,
                      style: CustomTextStyles.labelLargeBluegray700,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgSearchBlueGray700,
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  margin: EdgeInsets.only(left: 12.h),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Obx(
                    () => Text(
                      scheduleItemModelObj.time!.value,
                      style: CustomTextStyles.labelLargeBluegray700,
                    ),
                  ),
                ),
                Container(
                  height: 6.adaptSize,
                  width: 6.adaptSize,
                  margin: EdgeInsets.only(
                    left: 17.h,
                    top: 5.v,
                    bottom: 5.v,
                  ),
                  decoration: BoxDecoration(
                    color: appTheme.green600,
                    borderRadius: BorderRadius.circular(
                      3.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Obx(
                    () => Text(
                      scheduleItemModelObj.confirmed!.value,
                      style: CustomTextStyles.labelLargeBluegray700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 13.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomElevatedButton(
                  height: 46.v,
                  text: "lbl_cancel".tr,
                  margin: EdgeInsets.only(right: 7.h),
                  buttonStyle: CustomButtonStyles.fillGray,
                  buttonTextStyle: CustomTextStyles.titleSmallBluegray700,
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  height: 46.v,
                  text: "lbl_reschedule".tr,
                  margin: EdgeInsets.only(left: 7.h),
                  buttonStyle: CustomButtonStyles.fillBlue,
                  buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
